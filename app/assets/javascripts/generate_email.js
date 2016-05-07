function generate_email() {
    var first_name = document.getElementById('user_first_name').value;
    var last_name = document.getElementById('user_last_name').value;
    var result = document.getElementById('user_email');
    var myResult = first_name + last_name + '@coop_catalyst.com';
    result.value = myResult;


  }
