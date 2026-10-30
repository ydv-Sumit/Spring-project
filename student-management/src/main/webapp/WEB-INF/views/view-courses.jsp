<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>All Courses | Student Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
          rel="stylesheet">

    <!-- External CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/view-courses.css">
</head>

<body class="bg-light">

    <!-- Navbar -->
    <nav class="navbar navbar-dark bg-primary shadow-sm">
        <div class="container-fluid px-4">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">
                <i class="bi bi-mortarboard-fill me-2"></i>
                Student Management
            </a>

            <a href="${pageContext.request.contextPath}/"
               class="btn btn-light btn-sm">
                <i class="bi bi-house-door me-1"></i> Dashboard
            </a>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="container py-5">

        <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">All Courses</h2>
                <p class="text-secondary mb-0">
                    Students ke available courses yahan dekhein.
                </p>
            </div>

            <span class="badge text-bg-primary fs-6 px-3 py-2">
                <i class="bi bi-book-half me-1"></i>
                Total Courses: ${courses.size()}
            </span>
        </div>

        <div class="row g-4">

            <c:forEach var="course" items="${courses}" varStatus="status">

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card course-card border-0 shadow-sm h-100 rounded-4">
                        <div class="card-body p-4">

                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <div class="bg-primary-subtle text-primary rounded-3 p-3">
                                    <i class="bi bi-journal-code fs-3"></i>
                                </div>

                                <span class="badge text-bg-light border">
                                    Course ${status.count}
                                </span>
                            </div>

                            <h5 class="card-title fw-bold text-dark">
                                <c:out value="${course}"/>
                            </h5>

                            <p class="card-text text-secondary">
                                Is course mein enrolled students ki details
                                Student Management system mein manage hoti hain.
                            </p>

                            <div class="border-top pt-3 mt-3">
                                <span class="text-primary fw-semibold">
                                    <i class="bi bi-check-circle-fill me-1"></i>
                                    Available Course
                                </span>
                            </div>

                        </div>
                    </div>
                </div>

            </c:forEach>

            <c:if test="${empty courses}">
                <div class="col-12">
                    <div class="alert alert-info border-0 shadow-sm rounded-3">
                        <i class="bi bi-info-circle-fill me-2"></i>
                        Abhi database mein koi course available nahi hai.
                    </div>
                </div>
            </c:if>

        </div>

        <div class="mt-5">
            <a href="${pageContext.request.contextPath}/"
               class="btn btn-outline-primary">
                <i class="bi bi-arrow-left me-1"></i>
                Back to Dashboard
            </a>
        </div>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>