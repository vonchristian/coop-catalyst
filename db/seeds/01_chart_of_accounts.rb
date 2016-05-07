
Accounting::Accounts::Asset.create(code: 100, :name => "Cash on Hand")
Accounting::Accounts::Asset.create(code: 200, :name => "Cash in Bank")
Accounting::Accounts::Asset.create(code: 300, :name => "Loans Receivable")


Accounting::Accounts::Liability.create(code: 400, :name => "Interest on Share Capital Payable")
Accounting::Accounts::Liability.create(code: 500, :name => "Unearned Interest Income")
Accounting::Accounts::Liability.create(code: 600, :name => "Unearned Service Fee")

Accounting::Accounts::Liability.create(code: 700, :name => "Other Current Liabilities")
Accounting::Accounts::Liability.create(code: 800, :name => "Due to Officers and Employees")
Accounting::Accounts::Liability.create(code: 900, :name => "Accounts Payable")

Accounting::Accounts::Equity.create(code: 1000, :name => "Share Capital" )
Accounting::Accounts::Equity.create(code: 1100, :name => "Grants" )
Accounting::Accounts::Equity.create(code: 1200, :name => "Reserve Fund")
Accounting::Accounts::Equity.create(code: 1300, :name => "Education and Training Fund")
Accounting::Accounts::Equity.create(code: 1400, :name => "Optional Fund")
Accounting::Accounts::Equity.create(code: 1500, :name => "Community Development Fund")

Accounting::Accounts::Revenue.create(code: 1600, :name => "Revenue")
Accounting::Accounts::Revenue.create(code: 1700, :name => "Interest Income")
Accounting::Accounts::Revenue.create(code: 1800, :name => "Service Fee")
Accounting::Accounts::Revenue.create(code: 1900, :name => "Interest Rebate", contra: true)

Accounting::Accounts::Expense.create(code: 2000, :name => "Staff Benefits and Allowance")
Accounting::Accounts::Expense.create(code: 2100, :name => "Printing and Office Supplies")
Accounting::Accounts::Expense.create(code: 2300, :name => "Travelling Allowance")
Accounting::Accounts::Expense.create(code: 2400, :name => "Auditing Service")
Accounting::Accounts::Expense.create(code: 2500, :name => "Fidelity Bond")
Accounting::Accounts::Expense.create(code: 2600, :name => "CDA Certification")
Accounting::Accounts::Expense.create(code: 2700, :name => "Miscellaneous")
