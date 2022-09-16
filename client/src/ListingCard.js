import React, { useState } from "react";

function ListingCard({ item, deleteById, handleClick, showDelete }) {
  const [quantity, setQuantity] = useState(1);

  function handleDelete(id) {
    fetch("items/" + id, {
      method: "DELETE"
    })
    deleteById(id)
  } 

  return (
    <li className="card">
      <div className="image">
        <span className="price">${item.price}</span>
        <img src={item.image} alt={"description"} />
      </div>
      <div className="details">
        <h3>{item.name}</h3>
        <h4>Stock: {item.quantity}</h4>
        <p>{item.description}</p>
        <div style={{display:"flex",justifyContent:"center",marginTop:10}}>
          <input value={quantity} type="number" onChange={(e) => setQuantity(e.target.value)}/>
          <button onClick={() => handleClick(item, quantity)} className="emoji-button cart" style={{ backgroundColor: "lightblue", color: "white", width: "40%", padding: 10, borderRadius: 5 }}>Purchase 🛒</button>
          { showDelete && <button onClick={() => handleDelete(item.id)} className="emoji-button cart" style={{ backgroundColor: "lightblue", color: "white", width: "40%", padding: 10, borderRadius: 5 }}>Delete</button>}
        </div>
      </div>
    </li>
  );
}

export default ListingCard;
