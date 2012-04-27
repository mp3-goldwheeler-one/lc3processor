echo "--- Executing initialization force file to test LRU 4 Logic ---"
force /line_in "11100100" @10
force /line_access "10" @10
force /line_access "11" @100
force /line_access "01" @150
force /line_access "00" @200

run 300

force /line_in "00101101" @300
force /line_access "10" @300
force /line_access "11" @350
force /line_access "01" @400
force /line_access "00" @450

run 300
