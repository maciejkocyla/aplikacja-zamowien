function remove_fields (link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

// Odpalamy dopier po władowaniu całej strony
$(function(){
  // Event - zmiana wartości selecta z listą klientów
  $('#new_order_client_selection').change(function(e) {
    // Pobieramy ID wybranego klienta
    var clientId = $(e.target).val();

    // Jeśli jest ID, przeładowujemy stronę dodająć parametr client_id
    if (clientId) {
      window.location.href = window.location.href.replace( /[\?#].*|$/, "?client_id=" + clientId );
    // Jeślie nie ma ID (wybrany "nowy klient") przeładowujemy stronę bez
    // parametrów
    } else {
      window.location.href = window.location.href.replace( /[\?#].*|$/, "");
    }
  })
})
