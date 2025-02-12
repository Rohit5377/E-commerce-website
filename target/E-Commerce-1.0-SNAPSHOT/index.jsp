
<%@page import="com.ecommerce.helper.Helper"%>
<%@page import="com.ecommerce.entities.Category"%>
<%@page import="com.ecommerce.dao.categoryDao"%>
<%@page import="com.ecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.dao.ProductDao"%>
<%@page import="com.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Components/common_css_js.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>

        <div class="row mt-2 mx-2">

            <%                String cat = request.getParameter("category");

                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = null;

                if (cat == null || cat.trim().equals("all")) {
                    list = dao.getAllProducts();
                } else {

                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);

                }

                categoryDao cdao = new categoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategorys();
            %>

            <!--show category-->
            <div class="col-md-2">

                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                        All Products
                    </a>



                    <%
                        for (Category c : clist) {

                    %>

                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action "><%= c.getCategoryTitle()%></a>

                    <%
                        }

                    %>
                </div>
            </div>
            <!--show products-->


            <div class="col-md-10">

                <!--row-->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="row row-cols-1 row-cols-md-4 g-4">

                            <!--traversing products-->
                            <%                                for (Product p : list) {
                            %>
                            <div class="card product-card mx-2" style="min-width: 400px";>
                                <div class="container text-center">
                                    <img src="img/products/<%= p.getpPhoto()%>" style="max-width: 100%; max-height: 200px; width: auto; " class="card-img-top m-2" alt="...">

                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName()%> </h5>
                                    <p class="card-text">
                                        <%= Helper.get10Words(p.getpDescription())%>
                                    </p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getPid()%>, '<%= p.getpName()%>', <%= p.getpriceAfterApplyDiscount()%>)">Add to cart</button>
                                    <button class="btn btn-outline-success">₹<%= p.getpriceAfterApplyDiscount()%>/- <span class="text-secondary discount-label">₹<%= p.getpPrice()%>,<%= p.getpDiscount()%>% </span> </button>
                                </div>


                            </div>


                            <%
                                }
                                if (list.size() == 0) {
                                    out.println("<h3> No item in this category </h3>");
                                }


                            %>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <%@include file="Components/common_modal.jsp" %>

    </body>
</html>
