(function ($) {
    $('#btnSearch').click(function (event) {
        event.preventDefault();

        // Lấy giá trị từ ô input tìm kiếm
        let searchText = $('#searchInput').val().trim();

        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        // Đặt lại tham số tìm kiếm
        searchParams.delete('query'); // Xóa tham số 'query' cũ nếu có

        if (searchText !== '') {
            searchParams.set('query', searchText); // Thêm tham số 'query' với giá trị tìm kiếm
        }

        // Cập nhật URL và tải lại trang
        window.location.href = currentUrl.toString();
    });

    // Lấy tham số 'query' từ URL và điền vào ô input tìm kiếm
    const params = new URLSearchParams(window.location.search);
    const searchQuery = params.get('query');
    if (searchQuery) {
        $('#searchInput').val(searchQuery);  // Đặt giá trị vào ô input tìm kiếm
    }
})(jQuery);

