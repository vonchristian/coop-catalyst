jQuery ->
  output = $('#accounting_transactions_capital_build_up_credit_amounts_attributes_0_amount')
  $('#accounting_transactions_capital_build_up_debit_amounts_attributes_0_amount').keyup (event) ->
    output.val(this.value)

jQuery ->
