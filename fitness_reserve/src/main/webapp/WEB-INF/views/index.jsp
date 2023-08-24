<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

    <!-- Carousel Start -->
    <div class="container-fluid px-0 mb-5">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/resources/img/carousel-2.jpg" alt="Image" style="height:100vh;">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7 text-start">
                                    <p class="fs-4 text-white animated slideInRight">Welcome to
                                        <strong>GREEN GYM</strong>
                                    </p>
                                    <h1 class="display-4 text-white animated slideInRight">프라이빗한 공간에서 <br>최고의 운동을 경험하다</h1>
                                    <a href="/reserve/reservation"
                                        class="btn py-3 px-5 animated slideInRight reserve-btn">지금 예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="/resources/img/carousel-1.jpeg" alt="Image" style="height:100vh;">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-end">
                                <div class="col-lg-7 text-end">
                                    <p class="fs-4 text-white animated slideInLeft">Welcome to <strong>GREEN GYM</strong>
                                    </p>
                                    <h1 class="display-4 text-white animated slideInLeft">프라이빗한 공간에서 <br>최고의 운동을 경험하다</h1>
                                    <a href="/reserve/reservation"
                                        class="btn py-3 px-5 animated slideInLeft reserve-btn">지금 예약하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- About Start -->
    <div class="container-xxl about my-5" id="About">
        <div class="container">
            <div class="row g-0">
                <div class="col-lg-6">
                    <div class="h-100 d-flex align-items-center justify-content-center" style="min-height: 300px;">
                        <button type="button" class="btn-play" data-bs-toggle="modal"
                            data-src="https://www.youtube.com/embed/TVNZiuzVpWg" data-bs-target="#videoModal">
                            <span></span>
                        </button>
                    </div>
                </div>
                <div class="col-lg-6 pt-lg-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="bg-white rounded-top p-5 mt-lg-5">
                        <p class="fs-5 fw-medium text-primary">About Us</p>
                        <h1 class="display-6 mb-4">GREEN PRIVATE GYM</h1>
                        <div class="row g-5 pt-2 mb-5">
                            <div class="col-sm-6">
                                <h5 class="mb-3">연중무휴 개인 운동공간 대여 서비스</h5>
                                <span>간편한 예약을 통해 시설을 시간 단위로 예약하고, 마음껏 시설을 이용할 수 있습니다.</span>
                            </div>
                            <div class="col-sm-6">
                                <h5 class="mb-3">최고급 파워랙 / 목재 플랫폼 완비</h5>
                                <span>모노리프트, 케이블, 티바로우 랫 풀다운까지 모든 옵션을 갖춘 최고급 파워랙과, 발목이 흔들리지 않는 리프팅을 위한 목재 플랫폼까지 완비하였습니다.</span>
                            </div>
                        </div>
                        <a class="btn btn-primary rounded-pill py-3 px-5" href="">Explore More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Video Modal Start -->
    <div class="modal modal-video fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content rounded-0">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">Youtube Video</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 16:9 aspect ratio -->
                    <div class="ratio ratio-16x9">
                        <iframe class="embed-responsive-item" src="" id="video" allowfullscreen
                            allowscriptaccess="always" allow="autoplay"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Video Modal End -->


    <!-- Service Start -->
    <div class="container-xxl py-5" id="Our">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-medium text-primary">Our Services</p>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item position-relative h-100">
                        <div class="service-text rounded p-5">
                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                style="width: 64px; height: 64px;">
                                <img class="img-fluid" src="resources/img/icon/dumbbell.png" alt="Icon">
                            </div>
                            <h5 class="mb-3">최고급 파워랙 / 목재 플랫폼 완비</h5>
                                <p class="mb-0">모노리프트, 케이블, 티바로우 랫 풀다운까지 모든 옵션을 갖춘 최고급 파워랙과, 발목이 흔들리지 않는 리프팅을 위한 목재 플랫폼까지 완비하였습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item position-relative h-100">
                        <div class="service-text rounded p-5">
                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                style="width: 64px; height: 64px;">
                                <img class="img-fluid" src="resources/img/icon/weight.png" alt="Icon">
                            </div>
                            <h5 class="mb-3">최고급 리프팅 장비와 충분한 중량</h5>
                                <p class="mb-0">Eleiko, REP fitness, Podium 등
                                 최상급 바벨과 함께 충분한 중량의 올림픽 규격 최고급 우레탄 플레이트와 주물 원판을 완비했습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item position-relative h-100">
                        <div class="service-text rounded p-5">
                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                style="width: 64px; height: 64px;">
                                <img class="img-fluid" src="resources/img/icon/protection.png" alt="Icon">
                            </div>
                            <h5 class="mb-3">감염병 예방을 위한 세스코 바이러스케어</h5>
                                <p class="mb-0">세균을 빠르고 강력하게 살균하는 세스코 바이러스케어 시스템으로 
                                더욱 안전한 운동을 즐길 수 있도록 하였습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item position-relative h-100">
                        <div class="service-text rounded p-5">
                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                style="width: 64px; height: 64px;">
                                <img class="img-fluid" src="resources/img/icon/padlock.png" alt="Icon">
                            </div>
                            <h5 class="mb-3">프라이빗한 이용을 위한 개별공간 분리 시스템</h5>
                                <p class="mb-0">더욱 편안하게 그린 프라이빗짐의 시설을 즐길 수 있도록, 분리된 개별공간 기반으로 운영되고 있습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item position-relative h-100">
                        <div class="service-text rounded p-5">
                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                style="width: 64px; height: 64px;">
                                <img class="img-fluid" src="resources/img/icon/weight-lifting.png" alt="Icon">
                            </div>
                            <h5 class="mb-3">개인 퍼스널 트레이닝</h5>
                                <p class="mb-0">그린 프라이빗짐은 퍼스널 트레이닝을 제공하고 있지 않으므로, 프리랜서 트레이너가
                                 개인별 고객과 대관 장소에서 자유롭게 수업을 진행할 수 있습니다.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item position-relative h-100">
                        <div class="service-text rounded p-5">
                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                style="width: 64px; height: 64px;">
                                <img class="img-fluid" src="resources/img/icon/camera.png" alt="Icon">
                            </div>
                            <h5 class="mb-3">때로는 스튜디오처럼</h5>
                                <p class="mb-0">유튜브 컨텐츠부터 프로필 촬영 등등 자유롭게 미디어 촬영 스튜디오 용도로도 사용이 가능합니다.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->
<%@ include file="includes/footer.jsp" %>