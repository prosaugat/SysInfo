#!/usr/bin/perl

use strict;
use warnings;

# System Information
my $hostname = `hostname`;
my $kernel = `uname -r`;
my $distribution = `lsb_release -d 2>/dev/null || cat /etc/*-release 2>/dev/null | head -n1`;
my $uptime = `uptime -p`;
my $cpu_info = `lscpu`;
my $memory_info = `free -h`;
my $disk_info = `df -h`;

# Network Information
my $network_info = `ifconfig -a`;  # Use 'ip a' if 'ifconfig' is not available

# Open Ports Information
my $open_ports = `netstat -tuln`;

# Routing Table Information
my $routing_table = `netstat -rn`;

# DNS Servers Information
my $dns_servers = -e "/etc/resolv.conf" ? `cat /etc/resolv.conf` : "DNS server information not available";

# Display the system, network, and open ports information
print "System Information for $hostname:\n";
print "Kernel Version: $kernel";
print "Distribution: $distribution";
print "Uptime: $uptime";
print "\nCPU Information:\n$cpu_info";
print "\nMemory Information:\n$memory_info";
print "\nDisk Information:\n$disk_info";
print "\nNetwork Information:\n$network_info";
print "\nOpen Ports:\n$open_ports";
print "\nRouting Table:\n$routing_table";
print "\nDNS Servers:\n$dns_servers";

exit;
