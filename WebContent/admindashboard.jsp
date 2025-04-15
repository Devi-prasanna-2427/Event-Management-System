<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            height: 100vh;
            overflow: hidden;
        }

        h1 {
            position: absolute;
            margin-left: 600px;
            top: 20px;
            font-size: 30px;
            font-weight: bold;
            color: #333;
            text-align: center;
        }

        h1 span.welcome {
            color: red;
        }

        h1 span.username {
            color: blue;
        }

        .background {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100%;
            background: url('https://png.pngtree.com/thumb_back/fh260/background/20240103/pngtree-vivid-abstract-texture-a-burst-of-colorful-background-image_13892083.png') no-repeat;
            background-size: cover;
            background-position: center;
        }

        .dashboard {
            padding: 10px;
            border-radius: 10px;
            width: 300px;
            position: absolute;
            top: 25px;
            left: 3px;
            z-index: 10;
            padding-top: 1px;
            bottom: 60px;
        }

        .menu {
            list-style: none;
            padding: 0;
        }

        .menu li {
            margin: 12px 0;
        }

        .menu a {
            text-decoration: none;
            background: #007bff;
            color: #fff;
            padding: 15px;
            display: block;
            border-radius: 10px;
            text-align: center;
            font-size: 20px;
        }

        .menu a:hover {
            background: #0056b3;
        }

        .slideshow-container {
            position: absolute;
            top: 56%;
            left: 60%;
            transform: translate(-50%, -50%);
            width: 75vw;
            height: 77vh;
            overflow: hidden;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .slides {
            display: none;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        h2 {
    color: white;
    padding-left: 40px;
    font-weight: bold;
    font-size: 35px;
    text-transform: uppercase;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}
        
    </style>
</head>
<body>
    <% 
        HttpSession httpSession = request.getSession(); 
        String username = (String) httpSession.getAttribute("username"); 
    %>

    <h1>Admin Dashboard <br> 
        <span class="welcome">Welcome</span> 
        <span class="username"><%= username %></span>
    </h1>

    <div class="background">
        <div class="dashboard">
            <h2>DASHBOARD</h2>
            <ul class="menu">
                <li><a href="viewusers.jsp">View All Users</a></li>
                <li><a href="createevent.html">Create Event</a></li>
                <li><a href="Manageevent.jsp">Manage Event </a></li>
                <li><a href="viewcustomerbookings.jsp">View Bookings</a></li>
               
           
                <li><a href="sendnotification.jsp">Send Notification to Users</a></li>
                <li><a href="#">Transaction</a></li>
                 <li><a href="viewquery.jsp">view queries and send response</a></li>
                <li><a href="home.html">Logout</a></li>
            </ul>
        </div>

        <!-- Slideshow Container -->
        <div class="slideshow-container">
            <img class="slides" src="img/e6.jpg" alt="Slide 1">
            <img class="slides" src="img/e7.jpg" alt="Slide 2">
            <img class="slides" src="https://i0.wp.com/busestoconcerts.com/wp-content/uploads/2017/11/concert-banner.jpg" alt="Slide 3">
        </div>
    </div>

    <script>
        let slideIndex = 0;
        function showSlides() {
            let slides = document.getElementsByClassName("slides");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1; }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }
        showSlides();
    </script>
</body>
</html>
