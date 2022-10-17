import React from "react";
import { NavLink } from "react-router-dom";

function Header({ searchItems, searchInput, setShow, size, setCurrentUser, currentUser }) {
  const logout = () => {
    fetch("/logout", {
      method: "DELETE",
    }).then(setCurrentUser(null));
  };

  return (
    <header className="headerbackground">
      <nav>
        <div className="navbar">
          <NavLink exact className="button" to="/">
            KeebX
          </NavLink>
          { currentUser.admin && <NavLink exact className="button" to="/listings/new">
            Sell
          </NavLink>}
          <NavLink exact className="button" to="/my_items">
            My Purchased Items
          </NavLink>
          <NavLink exact className="button" onClick={logout} to="/">
            Logout
          </NavLink>
        </div>
      </nav>
    </header>
  );
}

export default Header;
