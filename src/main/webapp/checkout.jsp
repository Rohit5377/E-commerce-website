<%

    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
    
    
    %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <div class="container">
            <div class="row mt-5">

                <div class="col-md-6">
                    <!--cart-->
                    <div class="card">

                        <div class="card-body">

                            <h3 class="text-center mb-3">Your Selected Items</h3>

                            <div class="cart-body"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">

                        <div class="card-body">

                            <h3 class="text-center mb-3">Your details for order</h3>

                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input value="<%= user.getUserEmail() %>" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="form-label">Your Name</label>
                                    <input value="<%= user.getUserName() %>" name="name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name"/>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="form-label">Your Contact</label>
                                    <input value="<%= user.getUserPhone() %>" name="name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Contact Number"/>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1" class="form-label">Your Shipping Address</label>
                                    <textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" rows="3"  placeholder="Enter Your Address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order now</button>
                                    <button class="btn btn-outline-primary">Continue shopping</button>
                                    
                                </div>
                                

                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <%@include file="Components/common_modal.jsp" %>
    </body>
</html>
