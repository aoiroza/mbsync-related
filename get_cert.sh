HOSTNAME=
PORT=143
CERT_FILE="$HOME/mail.cert"
openssl s_client -CApath /etc/ssl/cert -connect ${HOSTNAME}:"$PORT" -starttls imap -showcerts | perl -ne 'print if /BEGIN/../END/; print STDERR if /return/' > "$CERT_FILE"

openssl s_client  -CAfile $CERT_FILE -connect ${HOSTNAME}:"$PORT" -starttls imap 2>&1 < /dev/null
