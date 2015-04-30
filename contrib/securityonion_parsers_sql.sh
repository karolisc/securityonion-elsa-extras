#!/bin/sh

set -e

# Log Node vars
MYSQL_ROOT_USER="root"
MYSQL_PASS_SWITCH=""
MYSQL_NODE_DB="syslog"

# Web Node vars
MYSQL_DB="elsa_web"
MYSQL_HOST="localhost"
MYSQL_PORT="3306"
MYSQL_USER="elsa"
MYSQL_PASS="biglog"

MYSQL="mysql -u$MYSQL_ROOT_USER $MYSQL_PASS_SWITCH $MYSQL_NODE_DB -e"

$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("command", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("arg", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("file_size", "int", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("reply_msg", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("addl", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("notice", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("peer", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("tunnel_type", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("facility", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("syslog_severity", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("message", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("tx_hosts", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("rx_hosts", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("seen_bytes", "int", "NUMBER");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("total_bytes", "int", "NUMBER");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("missing_bytes", "int", "NUMBER");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("sha1", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("mac", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("assigned_ip", "int", "IPv4");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("lease_time", "int", "NUMBER");'

$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26000, "BRO_WEIRD")'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26001, "BRO_SYSLOG")'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26002, "BRO_TUNNEL")'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26003, "BRO_FTP")'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26004, "BRO_FILES")'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26005, "BRO_DHCP")'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26006, "BRO_SOFTWARE");'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26007, "BRO_SSH");'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26008, "BRO_IRC");'
$MYSQL 'INSERT IGNORE INTO classes(id, class) VALUES(26009, "BRO_INTEL");'


$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="name"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="addl"), 12);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="notice"), 13);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_WEIRD"), (SELECT id FROM fields WHERE field="peer"), 14);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="command"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="arg"), 12);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="mime_type"), 13);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="file_size"), 9);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FTP"), (SELECT id FROM fields WHERE field="reply_msg"), 14);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_TUNNEL"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_TUNNEL"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_TUNNEL"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_TUNNEL"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_TUNNEL"), (SELECT id FROM fields WHERE field="tunnel_type"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_TUNNEL"), (SELECT id FROM fields WHERE field="action"), 12);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SYSLOG"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SYSLOG"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SYSLOG"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SYSLOG"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SYSLOG"), (SELECT id FROM fields WHERE field="facility"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SYSLOG"), (SELECT id FROM fields WHERE field="syslog_severity"), 12);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SYSLOG"), (SELECT id FROM fields WHERE field="message"), 13);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="tx_hosts"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="rx_hosts"), 12);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="source"), 13);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="mime_type"), 14);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="seen_bytes"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="total_bytes"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="missing_bytes"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="md5"), 15);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_FILES"), (SELECT id FROM fields WHERE field="sha1"), 16);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_DHCP"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_DHCP"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_DHCP"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_DHCP"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_DHCP"), (SELECT id FROM fields WHERE field="mac"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_DHCP"), (SELECT id FROM fields WHERE field="assigned_ip"), 9);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_DHCP"), (SELECT id FROM fields WHERE field="lease_time"), 10);'

# Support new BRO_HTTP format
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_HTTP"), (SELECT id FROM fields WHERE field="mime_type"), 16);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_HTTP"), (SELECT id FROM fields WHERE field="status_code"), 9);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_HTTP"), (SELECT id FROM fields WHERE field="content_length"), 10);'

# Support new BRO_NOTICE format
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("protocol", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("sub_msg", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_NOTICE"), (SELECT id FROM fields WHERE field="notice_type"), 14);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_NOTICE"), (SELECT id FROM fields WHERE field="notice_msg"), 15);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_NOTICE"), (SELECT id FROM fields WHERE field="mime_type"), 11);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_NOTICE"), (SELECT id FROM fields WHERE field="desc"), 12);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_NOTICE"), (SELECT id FROM fields WHERE field="protocol"), 13);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_NOTICE"), (SELECT id FROM fields WHERE field="sub_msg"), 16);'

# BRO_SOFTWARE
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("software_type", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("version_major", "int", "NUMBER");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("version_minor", "int", "NUMBER");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("version_minor2", "int", "NUMBER");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("version_minor3", "int", "NUMBER");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("version_addl", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="software_type"), 11);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="name"), 12);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="version_major"), 7);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="version_minor"), 8);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="version_minor2"), 9);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="version_minor3"), 10);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="version_addl"), 13);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SOFTWARE"), (SELECT id FROM fields WHERE field="version"), 14);'

# BRO_SSH
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("direction", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("client", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("region", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="status"), 11);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="direction"), 12);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="client"), 13);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="server"), 14);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="country"), 15);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSH"), (SELECT id FROM fields WHERE field="region"), 16);'

# BRO_IRC
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("nick", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("value", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="nick"), 11);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="user"), 12);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="command"), 13);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="value"), 14);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="filename"), 15);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="file_size"), 9);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_IRC"), (SELECT id FROM fields WHERE field="mime_type"), 16);'

# BRO_INTEL
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("indicator", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("indicator_type", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("seen_where", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("sources", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="indicator"), 11);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="indicator_type"), 12);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="seen_where"), 13);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_INTEL"), (SELECT id FROM fields WHERE field="sources"), 14);'

# Additions for BRO_SSL version and cipher
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("ssl_version", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields (field, field_type, pattern_type) VALUES ("ssl_cipher", "string", "QSTRING");'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSL"), (SELECT id FROM fields WHERE field="ssl_version"), 13);'
$MYSQL 'INSERT IGNORE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SSL"), (SELECT id FROM fields WHERE field="ssl_cipher"), 14);'


# Additions for Bro x509.log
$MYSQL 'REPLACE INTO classes(id, class) VALUES(26010, "BRO_X509");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_version", "int", "NUMBER");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_version"), 5);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_serial", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_serial"), 11);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_subject", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_subject"), 12);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_issuer", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_issuer"), 13);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_key_alg", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_key_alg"), 14);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_sig_alg", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_sig_alg"), 15);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_key_type", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_key_type"), 16);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("cert_key_length", "int", "NUMBER");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_X509"), (SELECT id FROM fields WHERE field="cert_key_length"), 6);'

# Additions for Bro snmp.log
$MYSQL 'REPLACE INTO classes(id, class) VALUES(26011, "BRO_SNMP");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("get_requests", "int", "NUMBER");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="get_requests"), 9);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("get_responses", "int", "NUMBER");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="get_responses"), 10);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("duration", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="duration"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="version"), 12);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("community", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="community"), 13);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("display_string", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="display_string"), 14);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("up_since", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_SNMP"), (SELECT id FROM fields WHERE field="up_since"), 15);'

# Additions for Bro radius.log
$MYSQL 'REPLACE INTO classes(id, class) VALUES(26012, "BRO_RADIUS");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="dstport"), 8);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="user"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="mac"), 12);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("remote_ip", "int", "IPv4");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="remote_ip"), 9);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("connect_info", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="connect_info"), 13);'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("result", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_RADIUS"), (SELECT id FROM fields WHERE field="result"), 14);'

# Additions for Bro conn.log resp_country_code
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("resp_country_code", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map(class_id, field_id, field_order) VALUES( (SELECT id FROM classes WHERE class="BRO_CONN"), (SELECT id FROM fields WHERE field="resp_country_code"), 16);'

# Additions for updated Bro dns.log parser
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("query_class", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("query_type", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields (field, field_type, pattern_type) VALUES ("return_code", "string", "QSTRING");'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BRO_DNS"), (SELECT id FROM fields WHERE field="query_class"), 13);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BRO_DNS"), (SELECT id FROM fields WHERE field="query_type"), 14);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BRO_DNS"), (SELECT id FROM fields WHERE field="return_code"), 15);'

# Additions for new BIND parser
$MYSQL 'REPLACE INTO classes (id, class, parent_id) VALUES(11081, "BIND", 0);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BIND"), (SELECT id FROM fields WHERE field="srcip"), 5);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BIND"), (SELECT id FROM fields WHERE field="srcport"), 6);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BIND"), (SELECT id FROM fields WHERE field="dstip"), 7);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BIND"), (SELECT id FROM fields WHERE field="domain"), 11);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BIND"), (SELECT id FROM fields WHERE field="query_class"), 12);'
$MYSQL 'REPLACE INTO fields_classes_map (class_id, field_id, field_order) VALUES ((SELECT id FROM classes WHERE class="BIND"), (SELECT id FROM fields WHERE field="query_type"), 13);'

# Store all SQL schema updates as files in $SQL_DIR
SQL_DIR="/opt/elsa/contrib/securityonion/contrib/sql"

# Additions for SYSMON_PROCESS and SYSMON_NETWORK parsers
SQL="$SQL_DIR/sysmon.sql"
mysql -uroot < $SQL || echo "Error importing $SQL."

# Additions for WINDOWS_PROCESS class & associated fields
SQL="$SQL_DIR/win_process_tracking.sql"
mysql -uroot < $SQL || echo "Error importing $SQL."
