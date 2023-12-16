<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IR=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Homepage</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
form {
      width: 500px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      background-color: #F2FAFF;
    }

    label {
      display: block;
      margin-bottom: 5px;
      font-weight: 700;
      padding: 1px;
    }

    input {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
    }

    select {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
    }

    button {
      background-color: #0069d9;
      color: white;
      padding: 10px 20px;
      border: none;
      cursor: pointer;
	border-radius: 5px;
    }

    button:hover {
      background-color: #007bff;
    }

  </style>
</head>
<body>
<!========================================================================================================>
<!-- Header Section -->
<header>
	<img id="contact" src="phone.png"> 1-800-1234-567 &nbsp;&nbsp;
	<img id="contact" src="location.png"> 1234 Fulton Street San Diego, CA 91117 USA &nbsp; &nbsp;
	<img id="contact" src="mail1.png">&nbsp;mail@tracking.org
</header>
<!========================================================================================================>
<!-- Logo -->
<div class="row">
  <div class="column" style="width: 15%;"><p><a href="homepage.html"><img src="logo.png"></a></p></div>
  <div class="column" style="width: 60%;"></div>

  <div class="column" style="width: 25%; padding-top:50px;">
	<a href="signup.html" class="sign-in-link">Sign Up</a>
  </div>
</div>
<!========================================================================================================>
<!-- Navigation -->
<div><nav class="menu"> </nav></div>
<!========================================================================================================>
<!-- Main -->
<div class="row">
	<div style="width: 100%; height: 75vh; padding-top: 50px; border-radius: 5px;">
<form action="register" method="post">
<h1 style="color:#056EB9; text-align:center;">Sign In</h1><br>
<label for="userType">User Type:</label>
<select id="selectElement" name="usertype" required>
	<option value="">Are you a student or parent?</option>
	<option value="option1">Student</option>
	<option value="option2">Parent</option>
</select>


<label for="email">Email:</label>
<input placeholder="Email id" type="email" id="email" name="email" required>

<label for="password">Password:</label>
<input placeholder="Enter Password" type="password" id="password" name="password" required>


<br><br>
<center><button type="submit"><b>Sign In</b></button></center>

</form>

	</div>

</div>
<!========================================================================================================>
<!-- Footer Section -->
<footer>&copy; 2023 Homework Tracker, all rights reserved</footer>
</body>
</html>