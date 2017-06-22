$(document).ready(function() {
  $('#bar').on('submit', function(event){
    event.preventDefault()
    $.ajax({
      url: '/urls',
      method: 'post',
      data: $(this).serialize(),

      beforeSend: function() {
        $('#success').html('Shortening...')
      },

      complete: function() {
        $('#success').html('Url is shortened!')        
      },


      success: function(data) {
        result = JSON.parse(data)
        console.log(result.short_url)        
        console.log(result.long_url)
        $('tr:first-child').after('<tr><td><a href="/' +result.short_url + '" target="_blank">' + result.short_url + '</a></td><td>' + result.long_url + '</td><td>0</td><tr>')
      },

      error: function() {
        alert("Incomplete URL. Try again.");
      },
    })
  }),
  $('tbody tr td a').on('click', function(nom){
    // kira is the click count td next to the clicked link
    kira = $(nom.target).parent().next().next()
    // current click count + 1
    num = parseInt(kira.text()) + 1 
    // update click count value
    kira.text(num)
  })
})