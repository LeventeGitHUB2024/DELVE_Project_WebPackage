<?php
session_start();
require 'db.php';

// Ellenőrizd, hogy a felhasználó be van-e jelentkezve
if (!isset($_SESSION['user_email'])) {
    header("Location: login.php");
    exit;
}

// Kiírhatod a felhasználó nevét vagy e-mail címét
$pdo = db();
$stmt = $pdo->prepare("SELECT players_pyr.*, saves_sae.* 
FROM players_pyr 
LEFT JOIN saves_sae ON players_pyr.email = saves_sae.PYR_id 
WHERE players_pyr.email = :email");

$stmt->execute([
    'email' => $_SESSION['user_email']]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DELVE-PCG UCP</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="./img/favico2.png" type="image/png">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="UCP/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="UCP/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/UCPbootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/UCPstyle.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <h3 class="text-primary"><img id='delvelogo' src="./img/delve_logo.png" alt="Delve_logo" id="kep"></i>User Control Panel</h3>
                <a href="#" class="navbar-brand mx-4 mb-3"></a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div id="online" class="position-relative">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mt-3 fs-5"><?php echo htmlspecialchars($user['username']); ?></h6>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="UCP.php" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <!--<div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                    </div>-->
                    <!--<a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>-->
                    <!--<a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>-->
                    <a href="table.php" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Saves</a>
                    <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Statistics</a> <!--ezek még módosítva lesznek-->
                    <div class="nav-item dropdown">
                        <!--<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="signin.html" class="dropdown-item">Sign In</a>
                            <a href="signup.html" class="dropdown-item">Sign Up</a>
                            <a href="404.html" class="dropdown-item">404 Error</a>
                            <a href="blank.html" class="dropdown-item">Blank Page</a>-->
                    </div>
                </div>
        </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
            <a href="index.php" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <p id="sitetitle">
            <p id='belsotitle' class="mx-auto navbar-brand text-primary"><?php echo htmlspecialchars($user['username']); ?>'s Profile</p>
            </p>
            <div class="navbar-nav align-items-center ms-auto">
                
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-bell me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Notification</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">We are working very hard to complete this page. <br> Thank you for understanding.</h6>
                            <small>2025.02.21. 10:20</small>
                        </a>
                        <!--<hr class="dropdown-divider">
                        <a href="#" class="dropdown-item text-center">See all notifications</a>-->
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <span class="d-none d-lg-inline-flex"><?php echo htmlspecialchars($user['username']); ?></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="logout.php" class="dropdown-item">Log Out</a> <!-- ez még trükkös, de inkább a logout fájl kellene polisholni-->
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- később felhasználandó
            
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Sale</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Sale</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Revenue</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Revenue</p>
                                <h6 class="mb-0">$1234</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Worldwide Sales</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="worldwide-sales"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Salse & Revenue</h6>
                                <a href="">Show All</a>
                            </div>
                            <canvas id="salse-revenue"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            eddig -->


        <!--- User Informations -->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4">
                <div class="col-sm-12 col-xl-12">
                    <div class="bg-secondary rounded h-100 p-4">
                        <h6 class="mb-4"></h6>
                        <table class="table table-hover">
                            <thead>
                                <tr>                                    
                                    <th scope="col" class="fs-5 fw-bold">General Account Informations</th>
                                    <th></th>
                                    <th></th>                                    
                                    <th></th>                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr>                                    
                                    <th class="fw-bold">E-mail Adress:</th>
                                    <td></td>
                                    <td></td>
                                    <td class="text_right"><?php echo htmlspecialchars($user['email']); ?></td>
                                </tr>
                                <tr>                                    
                                    <th class="fw-bold">Member here since:</th>
                                    <td></td>
                                    <td></td>
                                    <td class="text_right"><?php echo htmlspecialchars($user['registration_date']); ?></td>
                                </tr>
                                <tr>
                                <th class="fw-bold">Longest Playtime:</th>
                                    <td></td>
                                    <td></td>
                                    <td class="text_right"><?php echo htmlspecialchars($user['playtime']); ?></td>
                                </tr>
                                <th class="fw-bold">Deactivated:</th>
                                    <td></td>
                                    <td></td>
                                    <td class="text_right"><?php echo htmlspecialchars($user['deactivated'] == 1) ? 'yes' : 'no'; ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!--  User Informations End -->


        <!-- Widgets Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4">
                <div class="col-sm-12 col-md-6 col-xl-4">
                    <div class="h-100 bg-secondary rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="mb-0">Messages</h6>
                        </div>
                        <div class="d-flex align-items-center pt-3">
                            <img class="rounded-circle flex-shrink-0" src="img/favico2.png" alt="" style="width: 47px; height: 45px;">
                            <div class="w-100 ms-3">
                                <div class="d-flex w-100 justify-content-between">
                                    <h6 class="mb-0">DELVE-PCG WebTeam</h6>
                                    <small>1 minutes ago</small>
                                </div>
                                <span>Welcome back, <?php echo htmlspecialchars($user['username']); ?>! </span>
                            </div>
                        </div>
                        <div class="d-flex align-items-center pt-3">
                            <img class="rounded-circle flex-shrink-0" src="img/favico2.png" alt="" style="width: 47px; height: 45px;">
                            <div class="w-100 ms-3">
                            <div class="d-flex w-100 justify-content-between mt-4">
                                    <h6 class="mb-0">DELVE-PCG WebTeam</h6>
                                    <small>UPDATE</small>
                                </div>
                                <span>We have updated our Terms of Service and Privacy Policy, so I guess you should have a look. </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 col-xl-4">
                    <div class="h-100 bg-secondary rounded p-4">
                    <h6 class="mb-0">You can already BETA-TEST our little game here:</h6>
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <a href="download.php" class="downloadbtn">
                            <button>Letöltés</button>
                            </a>     
                        </div>
                        <div></div>
                    </div>  
                </div>
                <div class="col-sm-12 col-md-6 col-xl-4">
                    <div class="h-100 bg-secondary rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Timer (will be)</h6>     
                        </div>
                        <div id="calender"></div>
                    </div>  
                </div>
                
            </div>
        </div>
        <!-- Widgets End -->


        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-secondary rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">DELVE UCP</a>, All Right Reserved.
                    </div>
                    <div class="col-12 col-sm-6 text-center text-sm-end">
                        Designed By Szabó Levente</a>
                        <br>Distributed By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->

    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="UCP/lib/chart/chart.min.js"></script>
    <script src="UCP/lib/easing/easing.min.js"></script>
    <script src="UCP/lib/waypoints/waypoints.min.js"></script>
    <script src="UCP/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="UCP/lib/tempusdominus/js/moment.min.js"></script>
    <script src="UCP/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="UCP/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/UCPmain.js"></script>
</body>
</html>