
class config {
	$mail_server_name = "${fqdn}"
	$generate_certificate = "true"
	if $::vm_type == "vagrant" {
		$files = "/etc/puppet/files"
	} else {
		$files = "./files"
	}

	$memcache_memory = "128m"

	if $generate_certificate == "true" {
		$certificate = "ssl-cert-snakeoil.pem"
		$certificate_key = "ssl-cert-snakeoil.key"
	} else {
		$certificate = "my-seed-cert.pem"
		$certificate_key = "my-seed-cert.key"
	}

	$maildb_user = 'mail'
	$maildb_name = 'mail'
	$maildb_pwd = get_password("/root/passwords/.mail.pwd")

	$mailadmin_user = "admin@$mail_server_name"
	$mailadmin_pwd = get_password("/root/passwords/.mailadmin.pwd")

	$roundcube_user = 'roundcube'
	$roundcube_name = 'roundcube'
	$roundcube_pwd = get_password("/root/passwords/.roundcube.pwd")

	$rainloop_user = 'rainloop'
	$rainloop_name = 'rainloop'
	$rainloop_pwd = get_password("/root/passwords/.rainloop.pwd")

	$ajenti_user = 'root'
	$ajenti_pwd  = get_password("/root/passwords/.ajenti.pwd")

	$vimbadmin_salt1 = get_password("/root/passwords/.vimbadmin_salt1.pwd", 64)
	$vimbadmin_salt2 = get_password("/root/passwords/.vimbadmin_salt2.pwd", 64)
	$vimbadmin_salt3 = get_password("/root/passwords/.vimbadmin_salt3.pwd", 64)

	$restore_maildb_backup = "false"
	#
	# Number of processors to use for amavis (less means less memory, more means more emails at a time)
	#
	$amavis_process_count = 3

	#
	# Maximum allowed email size.
	#
	$message_size_limit = 10240000


	$backup_user_allowed_key = ""
}
