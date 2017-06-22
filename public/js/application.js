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
        $('tr:first-child').after('<tr><td>' + result.short_url + '</td><td>' + 'http://localhost:9393/' + result.long_url + '</td><td>0</td><tr>')
      }
    })
  })
})


