gwmi -n root\dcim\sysman DCIM_BIOSPassword -f {AttributeName='AdminPwd'} | select -exp IsSet