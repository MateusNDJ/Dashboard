document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.createElement('input');
    searchInput.setAttribute('type', 'text');
    searchInput.setAttribute('placeholder', 'Buscar relatórios...');
    searchInput.classList.add('form-control', 'mb-3');
    
    const reportList = document.querySelector('.list-group');
    reportList.parentNode.insertBefore(searchInput, reportList);

    searchInput.addEventListener('keyup', function() {
        const filter = searchInput.value.toLowerCase();
        const items = reportList.getElementsByTagName('li');
        
        Array.from(items).forEach(function(item) {
            const text = item.textContent || item.innerText;
            if (text.toLowerCase().indexOf(filter) > -1) {
                item.style.display = '';
            } else {
                item.style.display = 'none';
            }
        });
    });
});
