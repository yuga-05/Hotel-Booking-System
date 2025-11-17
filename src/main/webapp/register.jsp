<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f6f9;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 450px;
      margin: 80px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 4px 15px rgba(0,0,0,0.2);
    }
    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }
    label {
      display: block;
      margin: 10px 0 5px;
      font-weight: bold;
      color: #444;
    }
    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
      font-size: 14px;
    }
    button {
      width: 100%;
      padding: 12px;
      background: #28a745;
      border: none;
      border-radius: 6px;
      color: #fff;
      font-size: 16px;
      cursor: pointer;
      transition: 0.3s;
    }
    button:hover {
      background: #1e7e34;
    }
    .alert {
      padding: 10px;
      margin-bottom: 15px;
      color: #721c24;
      background: #f8d7da;
      border: 1px solid #f5c6cb;
      border-radius: 6px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Create Account</h2>
    <% if (request.getAttribute("error") != null) { %>
      <div class="alert"><%=request.getAttribute("error")%></div>
    <% } %>
    <form method="post" action="register">
      <label>Name</label>
      <input type="text" name="name" placeholder="Enter your full name" required />

      <label>Email</label>
      <input type="email" name="email" placeholder="Enter your email" required />

      <label>Password</label>
      <input type="password" name="password" placeholder="Enter a strong password" required />

      <button type="submit">Register</button>
    </form>
  </div>
</body>
</html>
