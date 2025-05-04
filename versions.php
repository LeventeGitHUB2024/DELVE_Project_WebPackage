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
    <title>DELVE-PCG UCP Versions</title>
    <script async src="./js/screenSizeChecker.js"></script>

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
    <div class="wrapper">
    <div class="container-fluid position-relative d-flex p-0">
            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-secondary navbar-dark">
                    <h3><img id='delvelogo' src="./img/DELVE-PCG_logo2.png" alt="DELVE-PCG_logo" id="kep"></i>User Control Panel</h3>
                    <a href="#" class="navbar-brand mx-4 mb-3"></a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="UCP.php" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <a href="versions.php" class="nav-item nav-link active"><i class="fa fa-sharp-duotone fa-light fa-download me-2"></i>Other Versions</a>
                        <a href="TOS.html" class="nav-item nav-link" target="_blank"><i class="fa ffa-solid fa-newspaper me-2"></i>Terms of Service</a>
                        <a href="privacy_policy.html" class="nav-item nav-link" target="_blank"><i class="fa ffa-solid fa-newspaper me-2"></i>Privacy Policy</a>    
                        <div class="nav-item dropdown">
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
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <p id="sitetitle">
                <p id='belsotitle' class="mx-auto navbar-brand"><?php echo htmlspecialchars($user['username']); ?>'s Profile</p>
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
                                <h6 class="fw-normal mb-0">Thank you for your patience, the site is now finished. Have a nice day!</h6>
                                <small>2025.05.04.</small>
                            </a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <span class="d-none d-lg-inline-flex"><?php echo htmlspecialchars($user['username']); ?></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="settings.php" target="_blank" class="dropdown-item">Settings</a>
                            <a href="logout.php" class="dropdown-item">Log Out</a> <!-- ez még trükkös, de inkább a logout fájl kellene polisholni-->
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- később felhasználható
                
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
                                        <th scope="col" class="fs-5 fw-bold">Here are the versions avaiable right now:</th>
                                        <th></th>
                                        <th></th>                                    
                                        <th></th>                                    
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>                                    
                                        <th class="fw-bold">DELVE PCG BETA Version 0.1</th>
                                        <td></td>
                                        <td></td>
                                        <td class="text_right"><a href="download_DelveV0.1.php" class="downloadbtn2">
                                        <button>Download</button>
                                        </a>     
                                        </td>
                                    </tr>
                                    <tr>                                    
                                        <th class="fw-bold">DELVE PCG BETA Version 0.2</th>
                                        <td></td>
                                        <td></td>
                                        <td class="text_right"><a href="download_DelveV0.2.php" class="downloadbtn2">
                                        <button>Download</button>
                                        </a>     
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!--  User Informations End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <strong>DELVE-PCG</strong>, All Right Reserved.
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
        </div>
        <div id="message">
        This site is not mobile friendly, please open this site on a larger screen, or maybe on a PC!
        </div>
</body>
</html>