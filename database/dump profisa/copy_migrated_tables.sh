#!/bin/sh
# Workbench Table Data copy script
# Workbench Version: 8.0.40
# 
# Execute this to copy table data from a source RDBMS to MySQL.
# Edit the options below to customize it. You will need to provide passwords, at least.
# 
# Source DB: Mysql@127.0.0.1:3306 (MySQL)
# Target DB: Mysql@localhost:3306


# Source and target DB passwords
arg_source_password=
arg_target_password=
arg_source_ssh_password=
arg_target_ssh_password=

if [ -z "$arg_source_password" ] && [ -z "$arg_target_password" ] && [ -z "$arg_source_ssh_password" ] && [ -z "$arg_target_ssh_password" ] ; then
    echo WARNING: All source and target passwords are empty. You should edit this file to set them.
fi
arg_worker_count=2
# Uncomment the following options according to your needs

# Whether target tables should be truncated before copy
# arg_truncate_target=--truncate-target
# Enable debugging output
# arg_debug_output=--log-level=debug3

/Volumes/MySQL Workbench community-8.0.40/MySQLWorkbench.app/Contents/MacOS/wbcopytables \
 --mysql-source="root@127.0.0.1:3306" \
 --source-rdbms-type=Mysql \
 --target="root@localhost:3306" \
 --source-password="$arg_source_password" \
 --target-password="$arg_target_password" \
 --source-ssh-port="22" \
 --source-ssh-host="" \
 --source-ssh-user="" \
 --target-ssh-port="22" \
 --target-ssh-host="" \
 --target-ssh-user="" \
 --source-ssh-password="$arg_source_ssh_password" \
 --target-ssh-password="$arg_target_ssh_password" \
 --thread-count=$arg_worker_count \
 $arg_truncate_target \
 $arg_debug_output \
 --table '`profisa`' '`courses`' '`profisa`' '`courses`' '`id`' '`id`' '`id`, `courses_name`' --table '`profisa`' '`education`' '`profisa`' '`education`' '`id`' '`id`' '`id`, `Institution_name`, `id_courses`' --table '`profisa`' '`logs`' '`profisa`' '`logs`' '`id`' '`id`' '`id`, `user_id`, `action`, `timestamp`' --table '`profisa`' '`profile_education`' '`profisa`' '`profile_education`' '`id_profiles_education`' '`id_profiles_education`' '`id_profiles_education`, `id_profiles_advisor`, `id_profiles_finder`, `id_education`, `Certification`, `dt_start`, `dt_end`, `comments`' --table '`profisa`' '`profiles_advisor`' '`profisa`' '`profiles_advisor`' '`id`' '`id`' '`id`, `user_id`, `full_name`, `profile_picture`, `linkedin_url`, `instagram_url`, `overview`, `created_at`, `updated_at`, `profile_completed`, `is_active`' --table '`profisa`' '`profiles_finder`' '`profisa`' '`profiles_finder`' '`id`' '`id`' '`id`, `user_id`, `full_name`, `profile_picture`, `linkedin_url`, `instagram_url`, `overview`, `created_at`, `updated_at`, `profile_completed`' --table '`profisa`' '`requests`' '`profisa`' '`requests`' '`id`' '`id`' '`id`, `status`, `created_at`, `updated_at`, `id_profiles_advisor`, `id_profiles_finder`' --table '`profisa`' '`users`' '`profisa`' '`users`' '`id`' '`id`' '`id`, `email`, `password`, `created_at`, `updated_at`'

