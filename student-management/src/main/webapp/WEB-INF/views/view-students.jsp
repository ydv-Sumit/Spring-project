<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Students</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>All Students</h2>

        <a href="${pageContext.request.contextPath}/add-student"
           class="btn btn-primary">
            + Add Student
        </a>
    </div>

    <div class="card shadow">
        <div class="card-body">
        
         <!--search form start  -->
     <form action="${pageContext.request.contextPath}/search-students"
      method="get" class="d-flex gap-2 mb-3">

    <input type="text"
           name="keyword"
           class="form-control"
           placeholder="Search by name or email"
           value="${keyword}">

    <button type="submit" class="btn btn-primary">
        Search
    </button>

    <a href="${pageContext.request.contextPath}/view-students"
       class="btn btn-secondary">
        Reset
    </a>

</form>   
        
<!-- search  form end  -->
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Course</th>
                        <th>Gender</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td>${student.email}</td>
                            <td>${student.course}</td>
                            <td>${student.gender}</td>
                            
                            <!-- edit button  -->
                            
 <td>
    <a href="${pageContext.request.contextPath}/edit-student/${student.id}"
       class="btn btn-warning btn-sm">
        Edit
    </a>
    
    <a href="${pageContext.request.contextPath}/delete-student/${student.id}"
   class="btn btn-danger btn-sm "
   onclick="return confirm('Kya aap is student ko delete karna chahte hain?');">
    Delete
    </a>
    
</td>





                            
                        </tr>
                    </c:forEach>
                </tbody>

            </table>

            <a href="${pageContext.request.contextPath}/dashboard"
               class="btn btn-secondary">
                Back to Dashboard
            </a>

        </div>
    </div>

</div>

</body>
</html>