<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white">
            <h4>Edit Student</h4>
        </div>

        <div class="card-body">
            <form:form action="${pageContext.request.contextPath}/update-student"
                       method="post" modelAttribute="student">

                <form:hidden path="id"/>

                <div class="mb-3">
                    <label class="form-label">Student Name</label>
                    <form:input path="name" cssClass="form-control" required="required"/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <form:input path="email" type="email"
                                cssClass="form-control" required="required"/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Course</label>
                    <form:input path="course" cssClass="form-control" required="required"/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Gender</label>
                    <form:select path="gender" cssClass="form-select">
                        <form:option value="" label="Select Gender"/>
                        <form:option value="Male" label="Male"/>
                        <form:option value="Female" label="Female"/>
                    </form:select>
                </div>

                <button type="submit" class="btn btn-success">
                    Update Student
                </button>

                <a href="${pageContext.request.contextPath}/view-students"
                   class="btn btn-secondary">
                    Cancel
                </a>

            </form:form>
        </div>
    </div>
</div>

</body>
</html>