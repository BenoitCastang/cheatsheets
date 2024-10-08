## systemd is the init system of debian, responible for lauching all the services

systemctl ## list all services (it assumes the list-units option by default
systemctl list-unit-files ## list units, indicating type and status
systemctl list-unit-files --type=service ## list only services
systemctl list-jobs ## print cronjobs

systemctl status service ## print status of a service
systemctl stop service ## stop service
systemctl start service ## start service
systemctl restart service ## restart service
systemctl reload service ## reload configuration files
systemctl enable service ## enable service (make it start at server startup)
systemctl enable --now service ## start service immediatly without waiting for next server startup
systemctl disable service ## disable service (prevent it from starting at server startup)
