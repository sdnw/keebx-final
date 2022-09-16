import "./App.css";
import React, { useEffect, useState } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import PageLogin from "./PageLogin";
import MainPage from "./MainPage";
import Cart from "./Cart";
import Header from "./Header";
import MyItems from "./MyItems";
import ListingsForm from "./ListingsForm";
import ListingDetails from "./ListingDetails";

function App() {
  const [currentUser, setCurrentUser] = useState(null);
  const [errors, setErrors] = useState(null);
  const [listings, setListings] = useState([]);
  const [searchInput, setSearchInput] = useState("");
  const [cart, setCart] = useState([]);
  const [show, setShow] = useState(true);

  // on component mount, loads user from stored session if there is one
  useEffect(() => {
    fetch("/me").then((res) => {
      if (res.ok) {
        res
          .json()
          .then((user) => setCurrentUser(user))
          .then(fetchListings());
      } else {
        setErrors(res);
      }
    });
  }, []);

  const fetchListings = () => {
    fetch("/items")
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        setListings(data);
      });
  };

  const handleClick = (item, quantity) => {
 
    const data = {
      user_id: currentUser.id,
      item_id: item.id,
      quantity: quantity
    }
    fetch("/purchase", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    })
    .then(res => res.json())
    .then((data) => {
      console.log('update listing number')
      updateListings(data)
    });

  };

  const updateListings = (item) => {
    const newListings = listings.filter((listing) => listing.id !== item.id)

    setListings([...newListings, item])
  }

  const handleAddListing = (listing) => {
    setListings([...listings, listing])
  }

  function deleteById(id) {
    const filteredListings = listings.filter((listing) => listing.id !== id);
    setListings(filteredListings);
  }

  function searchItems(type) {
    setSearchInput(type);
  }

  const handleChange = (item, d) => {
    const ind = cart.indexOf(item);
    const arr = cart;
    arr[ind].amount += d;

    if (arr[ind].amount === 0) arr[ind].amount = 1;
    setCart([...arr]);
  };
  
  return (
    <Router>
      <div className="">
        {currentUser && (
          <Header currentUser={currentUser} setCurrentUser={setCurrentUser} size={cart.length} />
        )}
        <Switch>
          <Route exact path="/">
            {/* if user is logged in, show the main page, otherwise, show the login forms */}
            {currentUser ? (
              <MainPage
                currentUser={currentUser}
                setCurrentUser={setCurrentUser}
                setListings={setListings}
                listings={listings}
                searchInput={searchInput}
                setSearchInput={setSearchInput}
                searchItems={searchItems}
                handleClick={handleClick}
                setShow={setShow}
                deleteById={deleteById}
              />
            ) : (
              <PageLogin setCurrentUser={setCurrentUser} />
            )}
          </Route>
          <Route exact path="/listings/new">
            <ListingsForm component={ListingsForm} handleAddListing={handleAddListing}/>
          </Route>
          <Route exact path="/my_items">
            <MyItems currentUser={currentUser} deleteById={deleteById} handleClick={handleClick} />
          </Route>
          <Route exact path="/listings/:id">
            <ListingDetails />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

export default App;
