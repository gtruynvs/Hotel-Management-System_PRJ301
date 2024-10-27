document.addEventListener("DOMContentLoaded", function() {
    // Lấy các phần tử DOM cần thiết
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    const numBook = document.getElementById('numBook');
    const priceOfStay = document.getElementById('priceOfStay');
    const bookingFee = document.getElementById('bookingFee');
    const totalAmount = document.getElementById('totalAmount');
    const payBtn = document.getElementById('pay-btn');

    // Xử lý sự kiện khi checkbox thay đổi
    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            updateCartSummary();
        });
    });

    // Xử lý sự kiện khi nút thanh toán được nhấp
    payBtn.addEventListener('click', function() {
        alert('Payment processed successfully!');
        // Cập nhật lại giỏ hàng sau khi thanh toán
        checkboxes.forEach(function(checkbox) {
            checkbox.checked = false;
        });
        updateCartSummary();
    });

    // Hàm cập nhật tổng kết giỏ hàng
    function updateCartSummary() {
        let totalBook = 0;
        let totalPrice = 0;

        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                totalBook++;
                // Giả sử bạn có dữ liệu giá tiền và phí đặt phòng từng mục
                let price = parseFloat(checkbox.getAttribute('data-price'));
                let fee = parseFloat(checkbox.getAttribute('data-fee'));
                totalPrice += price + fee;
            }
        });

        // Cập nhật giá trị vào HTML
        numBook.textContent = totalBook;
        priceOfStay.textContent = `$${totalPrice.toFixed(2)}`;
        bookingFee.textContent = `$${(totalPrice * 0.1).toFixed(2)}`;
        totalAmount.textContent = `$${(totalPrice * 1.1).toFixed(2)}`; // Tổng cộng = Giá thuê + 10% phí đặt phòng
    }
});
