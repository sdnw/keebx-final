import React from "react";
import ListingCard from "./ListingCard";

function ListingsContainer({ listings, deleteById, handleClick, searchInput, currentUser }) {
  return (
    <main>
      <ul className="cards">
        {/* use the ListingCard component to display listings */}
        {_filteredListings().map((item) => (
          <ListingCard
            key={item.id}
            item={item}
            deleteById={deleteById}
            handleClick={handleClick}
            showDelete={currentUser.admin || false}
          />
        ))}
      </ul>
    </main>
  );

  function _filteredListings() {
    return searchInput.length > 0
      ? listings.filter(
          (listing) =>
            listing.name
              .toLowerCase()
              .includes(searchInput.toLowerCase()) ||
            listing.description
              .toLowerCase()
              .includes(searchInput.toLowerCase())
        )
      : listings;
  }
}

export default ListingsContainer;
