<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Login | Student Management System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/login.css">
</head>

<body>

    <!-- Decorative background shapes -->
    <div class="shape shape-one"></div>
    <div class="shape shape-two"></div>
    <div class="shape shape-three"></div>
    <div class="shape shape-four"></div>
    <div class="shape shape-five"></div>
    <div class="shape shape-six"></div>

    <!-- Login Card -->
    <div class="login-container">
        <div class="row g-0">

            <!-- Left Branding Panel -->
            <div class="col-md-6 brand-panel">

                <div class="brand-header">
                    <div class="brand-icon">
                        <i class="bi bi-mortarboard-fill"></i>
                    </div>

                    <div>
                        <h5>SMS Portal</h5>
                        <small>STUDENT MANAGEMENT</small>
                    </div>
                </div>

                <div class="brand-content">
                    <span class="welcome-label">WELCOME TO SMS</span>

                    <h1>Manage students.</h1>
                    <h1 class="highlight">Simplify education.</h1>

                    <p>
                        One place for student records, courses and
                        academic information.
                    </p>

                    <div class="feature">
                        <i class="bi bi-check-circle-fill"></i>
                        Easy student management
                    </div>

                    <div class="feature">
                        <i class="bi bi-check-circle-fill"></i>
                        Organized academic records
                    </div>
                </div>

                <div class="brand-footer">
                    SMART &bull; SIMPLE &bull; ORGANIZED
                </div>
            </div>

            <!-- Right Login Form -->
            <div class="col-md-6 form-panel">

                <div class="login-box">

                    <div class="mobile-logo">
                        <i class="bi bi-mortarboard-fill"></i>
                    </div>

                    <span class="form-label-top">ADMINISTRATOR</span>

                    <h2>Welcome back!</h2>
                    
                    <c:if test="${not empty error}">
                   <div class="alert alert-danger" role="alert">
                             ${error}
                       </div>
                      </c:if>
                      

                    <p class="subtitle">
                        Sign in to access your dashboard
                    </p>

                    <form action="${pageContext.request.contextPath}/login"
                          method="post">

                        <div class="mb-4">
                            <label for="email" class="form-label">
                                Email address
                            </label>

                            <div class="input-wrapper">
                                <i class="bi bi-envelope"></i>

                                <input type="email"
                                       id="email"
                                       name="email"
                                       class="form-control"
                                       placeholder="admin@example.com"
                                       autocomplete="username"
                                       required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="password" class="form-label">
                                Password
                            </label>

                            <div class="input-wrapper">
                                <i class="bi bi-lock"></i>

                                <input type="password"
                                       id="password"
                                       name="password"
                                       class="form-control"
                                       placeholder="Enter your password"
                                       autocomplete="current-password"
                                       required>

                                <button type="button"
                                        class="password-toggle"
                                        onclick="togglePassword()"
                                        aria-label="Show or hide password">
                                    <i id="eyeIcon" class="bi bi-eye"></i>
                                </button>
                            </div>
                        </div>

                        <button type="submit" class="login-btn">
                            Sign in to dashboard
                            <i class="bi bi-arrow-right"></i>
                        </button>

                        <div class="security-note">
                            <i class="bi bi-shield-lock-fill"></i>
                            Secure administrator access
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>

    <script>
        function togglePassword() {
            const password = document.getElementById("password");
            const eyeIcon = document.getElementById("eyeIcon");

            if (password.type === "password") {
                password.type = "text";
                eyeIcon.className = "bi bi-eye-slash";
            } else {
                password.type = "password";
                eyeIcon.className = "bi bi-eye";
            }
        }
    </script>

</body>
</html>