<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Student Management System</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/style.css">   <!-- ${pageContext.request.contextPath} — JSP Expression Language (EL) hai. Ye current web application ka context path deta hai. -->
</head>

<body>

<!-- Top Navbar -->
<!-- Top Navbar -->
<nav class="navbar navbar-dark top-navbar">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/dashboard">
            Student Management System
        </a>

        <div class="dropdown">
            <button class="btn text-white d-flex align-items-center gap-2"
                    type="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false">

                <i class="bi bi-person-circle fs-3"></i>

                <span class="text-start">
                    <strong>
                        <c:out value="${sessionScope.loggedInUser.name}" />
                    </strong>
                    <small class="d-block">Administrator</small>
                </span>

                <i class="bi bi-chevron-down"></i>
            </button>

            <ul class="dropdown-menu dropdown-menu-end shadow">
                <li>
                    <h6 class="dropdown-header">Admin Profile</h6>
                </li>

                <li>
                    <span class="dropdown-item-text">
                        <i class="bi bi-envelope me-2"></i>
                        <c:out value="${sessionScope.loggedInUser.email}" />
                    </span>
                </li>

                <li><hr class="dropdown-divider"></li>

                <li>
                    <a class="dropdown-item text-danger"
                       href="${pageContext.request.contextPath}/logout">
                        <i class="bi bi-box-arrow-right me-2"></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <aside class="col-md-2 sidebar p-3">

            <a href="${pageContext.request.contextPath}/dashboard"
               class="nav-link active">
                <i class="bi bi-house-fill me-2"></i>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/add-student" class="nav-link">
                <i class="bi bi-person-plus-fill me-2"></i>
                Add Student
            </a>

            <a href="${pageContext.request.contextPath}/view-students" class="nav-link">
                <i class="bi bi-people-fill me-2"></i>
                View Students
            </a>

            <a href="${pageContext.request.contextPath}/logout" class="nav-link">
                <i class="bi bi-box-arrow-right me-2"></i>
                Logout
            </a>

        </aside>

        <!-- Main Content -->
        <main class="col-md-10 main-content">

            <h2 class="fw-bold mb-4">Dashboard</h2>

            <!-- Welcome Message -->
            <div class="alert alert-primary mb-4" role="alert">
                <i class="bi bi-info-circle-fill me-2"></i>
                Welcome to Student Management System
            </div>

            <!-- Dashboard Cards -->
            <div class="row g-4 mb-4">

                <!-- Total Students -->
                <div class="col-xl-3 col-sm-6">
                    <div class="card stat-card blue h-100">
                        <div class="card-body d-flex align-items-center gap-3">
                            <div class="stat-icon">
                                <i class="bi bi-people-fill"></i>
                            </div>
                            <div>
                                  <h3>${totalStudents}</h3>
                                <p class="mb-0">Total Students</p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/view-students" class="card-footer stat-link">
                            View Details
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </div>
                </div>

                <!-- Male Students -->
                <div class="col-xl-3 col-sm-6">
                    <div class="card stat-card green h-100">
                        <div class="card-body d-flex align-items-center gap-3">
                            <div class="stat-icon">
                                <i class="bi bi-mortarboard-fill"></i>
                            </div>
                            <div>
                                <h3 class="fw-bold mb-1">${maleStudents}</h3>
                                <p class="mb-0">Male Students</p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/view-students?gender=Male" class="card-footer stat-link">
                            View Details
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </div>
                </div>

                <!-- Female Students -->
                <div class="col-xl-3 col-sm-6">
                    <div class="card stat-card orange h-100">
                        <div class="card-body d-flex align-items-center gap-3">
                            <div class="stat-icon">
                                <i class="bi bi-person-fill"></i>
                            </div>
                            <div>
                               <h3 class="fw-bold mb-1">${femaleStudents}</h3>
                                <p class="mb-0">Female Students</p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/view-students?gender=Female" class="card-footer stat-link">
                            View Details
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </div>
                </div>

                <!-- Courses -->
                <div class="col-xl-3 col-sm-6">
                    <div class="card stat-card purple h-100">
                        <div class="card-body d-flex align-items-center gap-3">
                            <div class="stat-icon">
                                <i class="bi bi-book-half"></i>
                            </div>
                            <div>
                                <h3 class="fw-bold mb-1">${totalCourses}</h3>
                                <p class="mb-0">Courses</p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/view-courses" class="card-footer stat-link">
                            View Details
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </div>
                </div>

            </div>

            <!-- Recent Students Table -->
            <div class="card students-card">

                <div class="card-header bg-white py-3">
                    <h5 class="fw-bold mb-0">Recent Students</h5>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle mb-0">

                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Course</th>
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
            <td>
                <a href="#" class="btn btn-primary btn-sm">
                    View
                </a>
            </td>
        </tr>
    </c:forEach>
</tbody>

                    </table>
                </div>
            </div>

        </main>
    </div>
</div>

<!-- Footer -->
<footer class="footer text-center py-4">
    © 2026 Student Management System. All Rights Reserved.
</footer>

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>