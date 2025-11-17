<%@ include file="header.jsp" %>
<style>
  /* Full page background image with overlay */
  body, html {
    height: 100%;
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: 
      linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
      url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1470&q=80') no-repeat center center fixed;
    background-size: cover;
  }

  .container {
    max-width: 400px;
    background: rgba(255, 255, 255, 0.95);
    margin: 80px auto;
    padding: 35px 40px;
    border-radius: 12px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.3);
  }

  h1 {
    text-align: center;
    margin-bottom: 30px;
    color: #064663;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.5px;
  }

  form label {
    display: block;
    margin-bottom: 8px;
    color: #0B7285;
    font-weight: 600;
    font-size: 15px;
  }

  form input[type="date"],
  form input[type="number"] {
    width: 100%;
    padding: 12px 14px;
    margin-bottom: 22px;
    border: 2px solid #45a29e;
    border-radius: 8px;
    font-size: 16px;
    color: #064663;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
  }

  form input[type="date"]:focus,
  form input[type="number"]:focus {
    border-color: #0f4c75;
    box-shadow: 0 0 8px #0f4c75;
    outline: none;
  }

  button[type="submit"] {
    width: 100%;
    padding: 14px;
    background: #0f4c75;
    border: none;
    border-radius: 10px;
    color: #f1f6f9;
    font-size: 20px;
    font-weight: 700;
    cursor: pointer;
    letter-spacing: 1px;
    transition: background-color 0.4s ease;
  }

  button[type="submit"]:hover {
    background: #064663;
  }

  /* Responsive for smaller screens */
  @media (max-width: 450px) {
    .container {
      margin: 40px 20px;
      padding: 30px 20px;
    }
  }
</style>

<div class="container">
  <h1>Find your stay</h1>
  <form method="post" action="search">
    <label for="checkIn">Check-in</label>
    <input type="date" id="checkIn" name="checkIn" required />

    <label for="checkOut">Check-out</label>
    <input type="date" id="checkOut" name="checkOut" required />

    <label for="guests">Guests</label>
    <input type="number" id="guests" name="guests" min="1" value="1" required />

    <button type="submit">Search</button>
  </form>
</div>
