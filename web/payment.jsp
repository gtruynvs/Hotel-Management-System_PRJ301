<%-- 
    Document   : payment
    Created on : Jul 10, 2024, 9:53:18 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="x-icon" href="img/only-logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="css/payment.css">
        <title>StayEase - Payment Page</title>
        <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
        <style>
            /* Style for the modal box */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-top: 60px;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 500px;
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .modal-header h2 {
                margin: 0;
            }

            .close {
                color: #aaa;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: black;
            }

            /* CSS cho modal footer */
            .modal-footer {
                display: flex;
                justify-content: flex-end; /* Căn phải các phần tử bên trong */
                padding-top: 10px;
                border-top: 1px solid #ddd; /* Đường viền trên */
            }

            .modal-footer button {
                margin-left: 10px; /* Khoảng cách giữa các nút */
                padding: 8px 20px; /* Kích thước nút */
                font-size: 16px; /* Cỡ chữ */
                cursor: pointer; /* Con trỏ chuột thành hình tay */
            }

            #cancelButton {
                background-color: #f44336; /* Màu nền nút Cancel */
                color: white; /* Màu chữ nút Cancel */
                border: none; /* Bỏ viền */
            }

            #cancelButton:hover {
                background-color: #cc0000; /* Màu nền khi hover nút Cancel */
            }

            #confirmButton {
                background-color: #4CAF50; /* Màu nền nút Confirm */
                color: white; /* Màu chữ nút Confirm */
                border: none; /* Bỏ viền */
            }

            #confirmButton:hover {
                background-color: #45a049; /* Màu nền khi hover nút Confirm */
            }

        </style>
    </head>
    <body>
        <c:set var="x" value="${sessionScope.user}"/>
        <!-- start: Payment -->
        <section class="payment-section">
            <div class="container">
                <div class="payment-wrapper">
                    <div class="payment-left">
                        <div class="payment-header">
                            <div class="payment-header-icon"><i class="ri-flashlight-fill"></i></div>
                            <div id="nameUser" class="payment-header-title">${x.firstName} ${x.lastName}'s Order</div>
                            <p class="payment-header-description"></p>
                        </div>
                        <div class="payment-content">
                            <div class="payment-body">
                                <div class="payment-plan">
                                    <div id="stayName" class="payment-plan-type">${requestScope.stayName}</div>
                                    <div class="payment-plan-info">

                                        <div class="payment-plan-info-price">${requestScope.totalAmount}vnd</div>
                                    </div>
                                </div>
                                <div class="payment-summary">
                                    <div class="payment-summary-item">
                                        <div class="payment-summary-name">Additional fee</div>
                                        <div class="payment-summary-price">10%</div>
                                    </div>

                                    <div class="payment-summary-divider"></div>
                                    <div class="payment-summary-item payment-summary-total">
                                        <div class="payment-summary-name">Total</div>
                                        <div id="price" class="payment-summary-price">${requestScope.finalAmount}VND</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="payment-right">
                        <form action="payment" method="POST" class="payment-form">
                            <h1 class="payment-title">Payment Details</h1>
                            <div class="payment-method">
                                <input type="radio" class="hidden-radio" name="payment" value="Visa" id="method-1" checked>
                                <label for="method-1" class="payment-method-item">
                                    <img src="img/visa.png" alt="">
                                </label>
                                <input type="radio" class="hidden-radio" name="payment" value="Mastercard" id="method-2">
                                <label for="method-2" class="payment-method-item">
                                    <img src="img/mastercard.png" alt="">
                                </label>
                                <input type="radio" class="hidden-radio" name="payment" value="Paypal" id="method-3">
                                <label for="method-3" class="payment-method-item">
                                    <img src="img/paypal.png" alt="">
                                </label>
                                <input type="radio" class="hidden-radio" name="payment" value="MOMO" id="method-4">
                                <label for="method-4" class="payment-method-item">
                                    <img src="img/momo-logo.png" alt="">
                                </label>
                                <input type="radio" class="hidden-radio" name="payment" value="ZaloPay" id="method-5">
                                <label for="method-5" class="payment-method-item">
                                    <img src="img/zalopay-logo.jpg" alt="">
                                </label>
                            </div>
                            <div class="payment-form-group">
                                <input type="email" value="${requestScope.email}" placeholder=" " class="payment-form-control" id="email">
                                <label for="email" class="payment-form-label payment-form-label-required">Email Address</label>
                            </div>
                            <div class="payment-form-group">
                                <input type="text" placeholder=" " class="payment-form-control" id="card-number">
                                <label for="card-number" class="payment-form-label payment-form-label-required">Card Number</label>
                            </div>
                            <div class="payment-form-group-flex">
                                <div class="payment-form-group">
                                    <input type="date" placeholder=" " class="payment-form-control" id="expiry-date">
                                    <label for="expiry-date" class="payment-form-label payment-form-label-required">Expiry Date</label>
                                </div>
                                <div class="payment-form-group">
                                    <input type="text" placeholder=" " class="payment-form-control" id="cvv">
                                    <label for="cvv" class="payment-form-label payment-form-label-required">CVV</label>
                                </div>
                            </div>
                            <div class="payment-form-footer">
                                <input type="hidden" name="bookingID" value="${requestScope.bookingID}">
                                <input type="hidden" name="finalAmount" value="${requestScope.finalAmount}">
                                <button type="button" class="payment-form-submit-button"><i class="ri-wallet-line"></i> Pay</button>
                                <button type="submit" name="button" value="cancel" class="payment-form-cancel-button">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- end: Payment -->
        <!-- The Modal -->
        <div id="confirmModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Confirm Payment</h2>
                    <span class="close">&times;</span>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to proceed with the payment?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="cancelButton">Cancel</button>
                    <button type="submit" id="confirmButton">Confirm</button>
                </div>
            </div>
        </div>
        <script>
            (function () {
                emailjs.init('JoBB8lIPuBiZ3B2qg');
            })();

            document.getElementById('confirmButton').onclick = function () {
                const stayName = '${requestScope.stayName}';
                const email = document.getElementById('email').value;
                const name = '${x.firstName} ${x.lastName}';
                        const roomType = '${requestScope.roomType}';
                        const acreage = '${requestScope.acreage}';
                        const checkin = '${requestScope.checkin}';
                        const checkout = '${requestScope.checkout}';
                        const capacity = '${requestScope.capacity} people';
                        const paymentMethod = document.querySelector('input[name="payment"]:checked').value;
                        const finalAmount = '${requestScope.finalAmount}VND';

                        emailjs.send('service_0gx93ar', 'template_9hqbvi1', {
                            sendername: name,
                            senderemail: email,
                            paymentmethod: paymentMethod,
                            stayname: stayName,
                            finalamount: finalAmount,
                            roomtype: roomType,
                            checkin: checkin,
                            checkout: checkout,
                            capacity: capacity,
                            acreage: acreage
                        })
                                .then(response => {
                                    console.log('SUCCESS!', response.status, response.text);
                                    alert('Your Payment has been paid successfully!');
                                    document.querySelector('.payment-form').submit();
                                })
                                .catch(error => {
                                    console.log('FAILED...', error);
                                    alert('There was an error paying your payment. Please try again.');
                                });
                    };
        </script>
        <script>
            const payButton = document.querySelector('.payment-form-submit-button');
            const cancelButton = document.querySelector('.payment-form-cancel-button');
            const modal = document.getElementById('confirmModal');
            const span = document.getElementsByClassName('close')[0];
            const cancelModalButton = document.getElementById('cancelButton');

            payButton.onclick = function () {
                modal.style.display = 'block';
            }

            span.onclick = function () {
                modal.style.display = 'none';
            }

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            }

            cancelModalButton.onclick = function () {
                window.location.href = 'your-cancel-url-here'; // Replace with your cancel URL
            }

        </script>
    </body>
</html>