<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page import="com.ecommerce.dao.categoryDao"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.entities.User"%>
<%

    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }


%>

 <!--Product category-->
 <%  categoryDao cdao = new categoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategorys();
    
//getting count

Map<String, Long> m= Helper.getCounts(FactoryProvider.getFactory());


 %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="Components/common_css_js.jsp" %>

    </head>
    <body>

        <%@include file="Components/navbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid">
                <%@include file="Components/message.jsp" %>
            </div>

            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/team.png" alt="user"/>
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted ">Users</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/customer.png" alt="user"/>
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted ">Categories</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user"/>
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted ">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!-- second row -->
            <div class="row mt-2">

                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/keys.png" alt="user"/>
                            </div>
                            <p class="mt-2">Click here to add new Category</p>
                            <h1 class="text-uppercase text-muted ">Add Category</h1>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user"/>
                            </div>
                            <p clas="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted ">Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>

        </div>



        <!--Category Modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addCategory" />

                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
                            </div>
                            <div class="form-group mt-2">
                                <textarea style="height: 300px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>
                            <div class="container text-center mt-2">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>




        <!--Product Modal-->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Product details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addProduct" />
                            
                            <div class="form-group mt-2">
                                <input type="text" class="form-control" name="pName" placeholder="Enter title of product" required />
                            </div>
                            <div class="form-group mt-2">
                                <textarea style="height: 100px;" class="form-control" placeholder="Enter product description" name="pDesc" required></textarea>
                            </div>
                            <div class="form-group mt-2">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter price of product" required />
                            </div>
                            <div class="form-group mt-2">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Discount of product" required />
                            </div>
                            <div class="form-group mt-2">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Quantity of product" required />
                            </div>
                            <!--Product category-->
                          
                            <div class="form-group mt-2">
                                <select name="catId" class="form-control" id="">
                                    <% for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>

                                    <% }%>

                                </select>
                            </div>

                            <div class="form-group mt-2">
                                <label for="pPic">Select picture of product</label><br>
                                <input type="file" id="pPic" name="pPic" required />
                            </div>



                            <div class="container text-center mt-2">
                                <button class="btn btn-outline-success">Add product</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>
                                    <%@include file="Components/common_modal.jsp" %>

    </body>
</html>
