<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f6f9;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 400px;
      margin: 80px auto;
      background: #fff;
      padding: 25px 30px;
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
      background: #007BFF;
      border: none;
      border-radius: 6px;
      color: #fff;
      font-size: 16px;
      cursor: pointer;
      transition: 0.3s;
    }
    button:hover {
      background: #0056b3;
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
    <h2>Login</h2>
    <% if (request.getAttribute("error") != null) { %>
      <div class="alert"><%=request.getAttribute("error")%></div>
    <% } %>
    <form method="post" action="login">
      <label>Email</label>
      <input type="email" name="email" placeholder="Enter your email" required />

      <label>Password</label>
      <input type="password" name="password" placeholder="Enter your password" required />

      <button type="submit">Login</button>
    </form>
  </div>
</body>
</html>
