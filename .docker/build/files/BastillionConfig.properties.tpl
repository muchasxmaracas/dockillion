#
# Bastillion Configuration Options
#
#
#set to true to regenerate and import SSH keys
resetApplicationSSHKey=false
#SSH key type 'dsa', 'rsa', or 'ecdsa' for generated keys
sshKeyType=rsa
#SSH key length for generated keys. 2048 => 'rsa','dsa'; 521 => 'ecdsa'
sshKeyLength=4096
#private ssh key, leave blank to generate key pair
privateKey=/opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb/bastillion
#public ssh key, leave blank to generate key pair
publicKey=/opt/bastillion/jetty/bastillion/WEB-INF/classes/keydb/bastillion.pub
#default passphrase, leave blank for key without passphrase
defaultSSHPassphrase=${randomPassphrase}
#enable audit
enableInternalAudit=${AUDIT}
#keep audit logs for in days
deleteAuditLogAfter=90
#The number of seconds that the client will wait before sending a null packet to the server to keep the connection alive
serverAliveInterval=60
#default timeout in minutes for websocket connection (no timeout for <=0)
websocketTimeout=0
#enable SSH agent forwarding
agentForwarding=false
#enable two-factor authentication with a one-time password - 'required', 'optional', or 'disabled'
oneTimePassword=${2FA}
#set to false to disable key management. If false, the Bastillion public key will be appended to the authorized_keys file (instead of it being overwritten completely).
keyManagementEnabled=true
#set to true to generate keys when added/managed by users and enforce strong passphrases set to false to allow users to set their own public key
forceUserKeyGeneration=false
#authorized_keys refresh interval in minutes (no refresh for <=0)
authKeysRefreshInterval=120
#Regular expression to enforce password policy
passwordComplexityRegEx=((?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()+=]).{8\,20})
#Password complexity error message
passwordComplexityMsg=Passwords must be 8 to 20 characters\, contain one digit\, one lowercase\, one uppercase\, and one special character
#HTTP header to identify client IP Address - 'X-FORWARDED-FOR'
clientIPHeader=
#specify a external authentication module (ex: ldap-ol, ldap-ad).  Edit the jaas.conf to set connection details
jaasModule=
#The session time out value of application in minutes
sessionTimeout=15
#Requires JDK with "Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files" installed - http://www.oracle.com/technetwork/java/javase/downloads/index.html
use256EncryptionKey=false

#Database and connection pool settings
#Database user
dbUser=${DBUSER}
#Database password
dbPassword=${DBPASSWORD}
#Database JDBC driver
dbDriver=org.h2.Driver
#Connection URL to the DB
dbConnectionURL=jdbc:h2:file:./keydb/bastillion;CIPHER=AES;
#Max connections in the connection pool
maxActive=25
#When true, objects will be validated before being returned by the connection pool
testOnBorrow=true
#The minimum number of objects allowed in the connection pool before spawning new ones
minIdle=2
#The maximum amount of time (in milliseconds) to block before throwing an exception when the connection pool is exhausted
maxWait=15000
