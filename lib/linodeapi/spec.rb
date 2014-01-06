##
# Dynamically updated spec from the api.spec call
# rubocop:disable all

module LinodeAPI
  API_SPEC =
{"linode.list"=>
  {"DESCRIPTION"=>
    "Returns a list of all Linodes user has access or delete to, including some properties",
   "PARAMETERS"=>
    {"LinodeID"=>
      {"DESCRIPTION"=>"Limits the list to the specified LinodeID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>""},
 "nodebalancer.node.update"=>
  {"DESCRIPTION"=>"Updates a Node's properties",
   "PARAMETERS"=>
    {"Label"=>
      {"DESCRIPTION"=>"This backend Node's label",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "NodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "Mode"=>
      {"DESCRIPTION"=>
        "The connections mode for this node.  One of 'accept', 'reject', or 'drain'",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Weight"=>
      {"DESCRIPTION"=>
        "Load balancing weight, 1-255. Higher means more connections.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Address"=>
      {"DESCRIPTION"=>
        "The address:port combination used to communicate with this Node",
       "TYPE"=>"string",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "domain.update"=>
  {"DESCRIPTION"=>"Update a domain record.",
   "PARAMETERS"=>
    {"DomainID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "Description"=>
      {"DESCRIPTION"=>"Currently undisplayed.",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Retry_sec"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "Expire_sec"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "status"=>
      {"DESCRIPTION"=>"0, 1, or 2 (disabled, active, edit mode)",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "master_ips"=>
      {"DESCRIPTION"=>
        "When type=slave, the zone's master DNS servers list, semicolon separated ",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Refresh_sec"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "lpm_displayGroup"=>
      {"DESCRIPTION"=>
        "Display group in the Domain list inside the Linode DNS Manager",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "SOA_Email"=>
      {"DESCRIPTION"=>"Required when type=master",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "TTL_sec"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "Domain"=>
      {"DESCRIPTION"=>"The zone's name", "TYPE"=>"string", "REQUIRED"=>false},
     "Type"=>
      {"DESCRIPTION"=>"master or slave", "TYPE"=>"string", "REQUIRED"=>false},
     "axfr_ips"=>
      {"DESCRIPTION"=>
        "IP addresses allowed to AXFR the entire zone, semicolon separated",
       "TYPE"=>"string",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "avail.datacenters"=>
  {"DESCRIPTION"=>"Returns a list of Linode data center facilities.",
   "PARAMETERS"=>{},
   "THROWS"=>""},
 "avail.linodeplans"=>
  {"DESCRIPTION"=>
    "Returns a structure of Linode PlanIDs containing the Plan label and the availability in each Datacenter. Please note, this method is deprecated and will be removed in the future.",
   "PARAMETERS"=>
    {"PlanID"=>
      {"DESCRIPTION"=>"Limits the list to the specified PlanID",
       "TYPE"=>"numeric",
       "REQUIRED"=>"no"}},
   "THROWS"=>""},
 "linode.disk.delete"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "DiskID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.webconsoletoken"=>
  {"DESCRIPTION"=>
    "Generates a console token starting a web console LISH session for the requesting IP",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "nodebalancer.create"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"Label"=>
      {"DESCRIPTION"=>"This NodeBalancer's label",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ClientConnThrottle"=>
      {"DESCRIPTION"=>
        "To help mitigate abuse, throttle connections per second, per client IP. 0 to disable. Max of 20.",
       "default"=>0,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "DatacenterID"=>
      {"DESCRIPTION"=>
        "The DatacenterID from avail.datacenters() where you wish to place this new NodeBalancer",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "PaymentTerm"=>
      {"DESCRIPTION"=>"Subscription term in months.  One of: 0, 1, 12, or 24",
       "TYPE"=>"numeric",
       "REQUIRED"=>true}},
   "THROWS"=>"NOACCESS,CCFAILED,VALIDATION"},
 "domain.create"=>
  {"DESCRIPTION"=>"Create a domain record.",
   "PARAMETERS"=>
    {"SOA_Email"=>
      {"DESCRIPTION"=>"Required when type=master",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Description"=>
      {"DESCRIPTION"=>"Currently undisplayed.",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "TTL_sec"=>
      {"DESCRIPTION"=>"", "default"=>0, "TYPE"=>"numeric", "REQUIRED"=>false},
     "Retry_sec"=>
      {"DESCRIPTION"=>"", "default"=>0, "TYPE"=>"numeric", "REQUIRED"=>false},
     "Expire_sec"=>
      {"DESCRIPTION"=>"", "default"=>0, "TYPE"=>"numeric", "REQUIRED"=>false},
     "status"=>
      {"DESCRIPTION"=>"0, 1, or 2 (disabled, active, edit mode)",
       "default"=>1,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Domain"=>
      {"DESCRIPTION"=>"The zone's name", "TYPE"=>"string", "REQUIRED"=>true},
     "master_ips"=>
      {"DESCRIPTION"=>
        "When type=slave, the zone's master DNS servers list, semicolon separated ",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Refresh_sec"=>
      {"DESCRIPTION"=>"", "default"=>0, "TYPE"=>"numeric", "REQUIRED"=>false},
     "lpm_displayGroup"=>
      {"DESCRIPTION"=>
        "Display group in the Domain list inside the Linode DNS Manager",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Type"=>
      {"DESCRIPTION"=>"master or slave", "TYPE"=>"string", "REQUIRED"=>true},
     "axfr_ips"=>
      {"DESCRIPTION"=>
        "IP addresses allowed to AXFR the entire zone, semicolon separated",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false}},
   "THROWS"=>"NOACCESS,VALIDATION"},
 "account.estimateinvoice"=>
  {"DESCRIPTION"=>
    "Estimates the invoice for adding a new Linode or NodeBalancer as well as resizing a Linode. This returns two fields: PRICE which is the estimated cost of the invoice, and INVOICE_TO which is the date invoice would be though with timezone set to America/New_York",
   "PARAMETERS"=>
    {"PaymentTerm"=>
      {"DESCRIPTION"=>
        "Subscription term in months. One of: 1, 12, or 24. This is required for modes 'linode_new' and 'nodebalancer_new'.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "mode"=>
      {"DESCRIPTION"=>
        "This is one of the following options: 'linode_new', 'linode_resize', or 'nodebalancer_new'.",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "PlanID"=>
      {"DESCRIPTION"=>
        "The desired PlanID available from avail.LinodePlans(). This is required for modes 'linode_new' and 'linode_resize'.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "LinodeID"=>
      {"DESCRIPTION"=>
        "This is the LinodeID you want to resize and is required for mode 'linode_resize'.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>"VALIDATION"},
 "account.updatecard"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"ccExpMonth"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ccExpYear"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ccNumber"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>""},
 "linode.disk.update"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"Label"=>
      {"DESCRIPTION"=>"The display label for this Disk",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "isReadOnly"=>
      {"DESCRIPTION"=>"Enable forced read-only for this Disk",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "DiskID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "stackscript.create"=>
  {"DESCRIPTION"=>"Create a StackScript.",
   "PARAMETERS"=>
    {"Label"=>
      {"DESCRIPTION"=>"The Label for this StackScript",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "rev_note"=>
      {"DESCRIPTION"=>"", "default"=>"", "TYPE"=>"string", "REQUIRED"=>false},
     "script"=>
      {"DESCRIPTION"=>"The actual script", "TYPE"=>"string", "REQUIRED"=>true},
     "isPublic"=>
      {"DESCRIPTION"=>
        "Whether this StackScript is published in the Library, for everyone to use",
       "default"=>false,
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "DistributionIDList"=>
      {"DESCRIPTION"=>
        "Comma delimited list of DistributionIDs that this script works on ",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "Description"=>
      {"DESCRIPTION"=>"", "default"=>"", "TYPE"=>"string", "REQUIRED"=>false}},
   "THROWS"=>"NOACCESS,VALIDATION"},
 "domain.resource.delete"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"DomainID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ResourceID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "nodebalancer.delete"=>
  {"DESCRIPTION"=>
    "Immediately removes a NodeBalancer from your account and issues a pro-rated credit back to your account, if applicable.",
   "PARAMETERS"=>
    {"NodeBalancerID"=>
      {"DESCRIPTION"=>"The NodeBalancerID to delete",
       "TYPE"=>"numeric",
       "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "linode.create"=>
  {"DESCRIPTION"=>
    "Creates a Linode and assigns you full privileges. There is a 75-linodes-per-hour limiter.",
   "PARAMETERS"=>
    {"PlanID"=>
      {"DESCRIPTION"=>"The desired PlanID available from avail.LinodePlans()",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "PaymentTerm"=>
      {"DESCRIPTION"=>
        "Subscription term in months for non-metered customers.  One of: 1, 12, or 24",
       "default"=>0,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "DatacenterID"=>
      {"DESCRIPTION"=>
        "The DatacenterID from avail.datacenters() where you wish to place this new Linode",
       "TYPE"=>"numeric",
       "REQUIRED"=>true}},
   "THROWS"=>"NOACCESS,CCFAILED,VALIDATION,LINODELIMITER,ACCOUNTLIMIT"},
 "stackscript.delete"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"StackScriptID"=>
      {"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "linode.disk.create"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"Label"=>
      {"DESCRIPTION"=>"The display label for this Disk",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "Size"=>
      {"DESCRIPTION"=>"The size in MB of this Disk.",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "Type"=>
      {"DESCRIPTION"=>
        "The formatted type of this disk.  Valid types are: ext3, swap, raw",
       "TYPE"=>"string",
       "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.disk.createfromstackscript"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"StackScriptUDFResponses"=>
      {"DESCRIPTION"=>
        "JSON encoded name/value pairs, answering this StackScript's User Defined Fields",
       "TYPE"=>"string",
       "REQUIRED"=>"yes"},
     "DistributionID"=>
      {"DESCRIPTION"=>
        "Which Distribution to apply this StackScript to.  Must be one from the script's DistributionIDList",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "rootPass"=>
      {"DESCRIPTION"=>"The root user's password",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "Label"=>
      {"DESCRIPTION"=>"The label of this new disk image",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "Size"=>
      {"DESCRIPTION"=>"Size of this disk image in MB",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "StackScriptID"=>
      {"DESCRIPTION"=>"The StackScript to create this image from",
       "TYPE"=>"numeric",
       "REQUIRED"=>"yes"}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.update"=>
  {"DESCRIPTION"=>"Updates a Linode's properties.",
   "PARAMETERS"=>
    {"ms_ssh_user"=>{"DESCRIPTION"=>"", "TYPE"=>"string", "REQUIRED"=>false},
     "Alert_cpu_enabled"=>
      {"DESCRIPTION"=>"Enable the cpu usage email alert",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "Alert_bwin_enabled"=>
      {"DESCRIPTION"=>"Enable the incoming bandwidth email alert",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "Alert_cpu_threshold"=>
      {"DESCRIPTION"=>"CPU Alert threshold, percentage 0-800",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Alert_bwquota_enabled"=>
      {"DESCRIPTION"=>"Enable the bw quote email alert",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "backupWindow"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "Alert_diskio_threshold"=>
      {"DESCRIPTION"=>"IO ops/sec", "TYPE"=>"numeric", "REQUIRED"=>false},
     "backupWeeklyDay"=>
      {"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "Label"=>
      {"DESCRIPTION"=>"This Linode's label",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "watchdog"=>
      {"DESCRIPTION"=>"Enable the Lassie shutdown watchdog",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "Alert_diskio_enabled"=>
      {"DESCRIPTION"=>"Enable the disk IO email alert",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "ms_ssh_port"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "lpm_displayGroup"=>
      {"DESCRIPTION"=>
        "Display group in the Linode list inside the Linode Manager",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ms_ssh_disabled"=>
      {"DESCRIPTION"=>"", "TYPE"=>"boolean", "REQUIRED"=>false},
     "Alert_bwquota_threshold"=>
      {"DESCRIPTION"=>"Percentage of monthly bw quota",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "ms_ssh_ip"=>{"DESCRIPTION"=>"", "TYPE"=>"string", "REQUIRED"=>false},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "Alert_bwin_threshold"=>
      {"DESCRIPTION"=>"Mb/sec", "TYPE"=>"numeric", "REQUIRED"=>false},
     "Alert_bwout_threshold"=>
      {"DESCRIPTION"=>"Mb/sec", "TYPE"=>"numeric", "REQUIRED"=>false},
     "Alert_bwout_enabled"=>
      {"DESCRIPTION"=>"Enable the outgoing bandwidth email alert",
       "TYPE"=>"boolean",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "nodebalancer.config.create"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"Stickiness"=>
      {"DESCRIPTION"=>
        "Session persistence.  One of 'none', 'table', 'http_cookie'",
       "default"=>"table",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_path"=>
      {"DESCRIPTION"=>"When check=http, the path to request",
       "default"=>"/",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_body"=>
      {"DESCRIPTION"=>
        "When check=http_body, a regex against the expected result body",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_interval"=>
      {"DESCRIPTION"=>"Seconds between health check probes.  2-3600",
       "default"=>5,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Algorithm"=>
      {"DESCRIPTION"=>
        "Balancing algorithm.  One of 'roundrobin', 'leastconn', 'source'",
       "default"=>"roundrobin",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "NodeBalancerID"=>
      {"DESCRIPTION"=>"The parent NodeBalancer's ID",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "check_attempts"=>
      {"DESCRIPTION"=>
        "Number of failed probes before taking a node out of rotation. 1-30",
       "default"=>2,
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Port"=>
      {"DESCRIPTION"=>"Port to bind to on the public interfaces. 1-65534",
       "default"=>80,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "check"=>
      {"DESCRIPTION"=>
        "Perform active health checks on the backend nodes.  One of 'connection', 'http', 'http_body'",
       "default"=>"connection",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ssl_key"=>
      {"DESCRIPTION"=>
        "Unpassphrased private key for the SSL certificate when protocol is 'https'",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Protocol"=>
      {"DESCRIPTION"=>"Either 'tcp', 'http', or 'https'",
       "default"=>"http",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_timeout"=>
      {"DESCRIPTION"=>
        "Seconds to wait before considering the probe a failure. 1-30.  Must be less than check_interval.",
       "default"=>3,
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ssl_cert"=>
      {"DESCRIPTION"=>
        "SSL certificate served by the NodeBalancer when the protocol is 'https'",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.ip.list"=>
  {"DESCRIPTION"=>"Lists a Linode's IP addresses.",
   "PARAMETERS"=>
    {"IPAddressID"=>
      {"DESCRIPTION"=>"If specified, limits the result to this IPAddressID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "avail.stackscripts"=>
  {"DESCRIPTION"=>"Returns a list of available public StackScripts.",
   "PARAMETERS"=>
    {"DistributionID"=>
      {"DESCRIPTION"=>
        "Limit the results to StackScripts that can be applied to this DistributionID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "keywords"=>
      {"DESCRIPTION"=>"Search terms", "TYPE"=>"string", "REQUIRED"=>false},
     "DistributionVendor"=>
      {"DESCRIPTION"=>"Debian, Ubuntu, Fedora, etc.",
       "TYPE"=>"string",
       "REQUIRED"=>false}},
   "THROWS"=>""},
 "api.spec"=>
  {"DESCRIPTION"=>
    "Returns a data structure of the entire Linode API specification.  This method does not require authorization.<br><br>For example: <a target=\"_blank\" href=\"https://api.linode.com/?api_action=api.spec\">https://api.linode.com/?api_action=api.spec</a>",
   "PARAMETERS"=>{},
   "THROWS"=>""},
 "linode.disk.list"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "DiskID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false}},
   "THROWS"=>""},
 "linode.clone"=>
  {"DESCRIPTION"=>
    "Creates a new Linode, assigns you full privileges, and then clones the specified LinodeID to the new Linode. There is a limit of 5 active clone operations per source Linode.  It is recommended that the source Linode be powered down during the clone.",
   "PARAMETERS"=>
    {"DatacenterID"=>
      {"DESCRIPTION"=>
        "The DatacenterID from avail.datacenters() where you wish to place this new Linode",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "PaymentTerm"=>
      {"DESCRIPTION"=>
        "Subscription term in months for non-metered customers.  One of: 1, 12, or 24",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "PlanID"=>
      {"DESCRIPTION"=>"The desired PlanID available from avail.LinodePlans()",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "LinodeID"=>
      {"DESCRIPTION"=>"The LinodeID that you want cloned",
       "TYPE"=>"numeric",
       "REQUIRED"=>true}},
   "THROWS"=>
    "NOACCESS,NOTFOUND,CCFAILED,VALIDATION,LINODELIMITER,ACCOUNTLIMIT"},
 "user.getapikey"=>
  {"DESCRIPTION"=>
    "Returns a user's API key.  If no API key exists, one is generated.  This method does not require an api_key to be passed in.",
   "PARAMETERS"=>
    {"password"=>{"DESCRIPTION"=>"", "TYPE"=>"string", "REQUIRED"=>true},
     "username"=>{"DESCRIPTION"=>"", "TYPE"=>"string", "REQUIRED"=>true}},
   "THROWS"=>""},
 "linode.delete"=>
  {"DESCRIPTION"=>
    "Immediately removes a Linode from your account and issues a pro-rated credit back to your account, if applicable.  To prevent accidental deletes, this requires the Linode has no Disk images.  You must first delete its disk images.\"",
   "PARAMETERS"=>
    {"LinodeID"=>
      {"DESCRIPTION"=>"The LinodeID to delete",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "skipChecks"=>
      {"DESCRIPTION"=>
        "Skips the safety checks and will always delete the Linode",
       "TYPE"=>"boolean",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,LINODENOTEMPTY"},
 "domain.resource.list"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"DomainID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ResourceID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false}},
   "THROWS"=>""},
 "nodebalancer.config.update"=>
  {"DESCRIPTION"=>"Updates a Config's properties",
   "PARAMETERS"=>
    {"Stickiness"=>
      {"DESCRIPTION"=>
        "Session persistence.  One of 'none', 'table', 'http_cookie'",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_path"=>
      {"DESCRIPTION"=>"When check=http, the path to request",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_body"=>
      {"DESCRIPTION"=>
        "When check=http_body, a regex against the expected result body",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_interval"=>
      {"DESCRIPTION"=>"Seconds between health check probes.  2-3600",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Algorithm"=>
      {"DESCRIPTION"=>
        "Balancing algorithm.  One of 'roundrobin', 'leastconn', 'source'",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ConfigID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "check_attempts"=>
      {"DESCRIPTION"=>
        "Number of failed probes before taking a node out of rotation. 1-30",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Port"=>
      {"DESCRIPTION"=>"Port to bind to on the public interfaces. 1-65534",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "check"=>
      {"DESCRIPTION"=>
        "Perform active health checks on the backend nodes.  One of 'connection', 'http', 'http_body'",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ssl_key"=>
      {"DESCRIPTION"=>
        "Unpassphrased private key for the SSL certificate when protocol is 'https'",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Protocol"=>
      {"DESCRIPTION"=>"Either 'tcp', 'http', or 'https'",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "check_timeout"=>
      {"DESCRIPTION"=>
        "Seconds to wait before considering the probe a failure. 1-30.  Must be less than check_interval.",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ssl_cert"=>
      {"DESCRIPTION"=>
        "SSL certificate served by the NodeBalancer when the protocol is 'https'",
       "TYPE"=>"string",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.reboot"=>
  {"DESCRIPTION"=>"Issues a shutdown, and then boot job for a given LinodeID.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ConfigID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND"},
 "linode.config.list"=>
  {"DESCRIPTION"=>"Lists a Linode's Configuration Profiles.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ConfigID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND"},
 "linode.disk.createfromdistribution"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"rootSSHKey"=>
      {"DESCRIPTION"=>
        "Optionally sets this string into /root/.ssh/authorized_keys upon distribution configuration.",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Label"=>
      {"DESCRIPTION"=>"The label of this new disk image",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "Size"=>
      {"DESCRIPTION"=>"Size of this disk image in MB",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "DistributionID"=>
      {"DESCRIPTION"=>
        "The DistributionID to create this disk from.  Found in avail.distributions()",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "rootPass"=>
      {"DESCRIPTION"=>"The root user's password",
       "TYPE"=>"string",
       "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.resize"=>
  {"DESCRIPTION"=>
    "Resizes a Linode from one plan to another.  Immediately shuts the Linode down, charges/credits the account, and issue a migration to another host server.",
   "PARAMETERS"=>
    {"PlanID"=>
      {"DESCRIPTION"=>"The desired PlanID available from avail.LinodePlans()",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,CCFAILED,VALIDATION"},
 "nodebalancer.node.list"=>
  {"DESCRIPTION"=>
    "Returns a list of Nodes associated with a NodeBalancer Config",
   "PARAMETERS"=>
    {"NodeID"=>
      {"DESCRIPTION"=>"Limits the list to the specified NodeID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "ConfigID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>""},
 "linode.job.list"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"JobID"=>
      {"DESCRIPTION"=>"Limits the list to the specified JobID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "pendingOnly"=>{"DESCRIPTION"=>"", "TYPE"=>"boolean", "REQUIRED"=>false}},
   "THROWS"=>""},
 "domain.list"=>
  {"DESCRIPTION"=>"Lists domains you have access to.",
   "PARAMETERS"=>
    {"DomainID"=>
      {"DESCRIPTION"=>"Limits the list to the specified DomainID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>""},
 "domain.resource.create"=>
  {"DESCRIPTION"=>"Create a domain record.",
   "PARAMETERS"=>
    {"DomainID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "Port"=>
      {"DESCRIPTION"=>"", "default"=>80, "TYPE"=>"numeric", "REQUIRED"=>false},
     "Name"=>
      {"DESCRIPTION"=>
        "The hostname or FQDN.  When Type=MX the subdomain to delegate to the Target MX server.",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ResourceID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "Weight"=>
      {"DESCRIPTION"=>"", "default"=>5, "TYPE"=>"numeric", "REQUIRED"=>false},
     "TTL_sec"=>
      {"DESCRIPTION"=>"TTL.  Leave as 0 to accept our default.",
       "default"=>0,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Priority"=>
      {"DESCRIPTION"=>"Priority for MX and SRV records, 0-255",
       "default"=>10,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Target"=>
      {"DESCRIPTION"=>
        "When Type=MX the hostname.  When Type=CNAME the target of the alias.  When Type=TXT the value of the record.  \n\t\tWhen Type=A or AAAA the token of '[remote_addr]' will be substituted with the IP address of the request.",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Protocol"=>
      {"DESCRIPTION"=>
        "The protocol to append to an SRV record.  Ignored on other record types.",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Type"=>
      {"DESCRIPTION"=>"One of: NS, MX, A, AAAA, CNAME, TXT, or SRV",
       "TYPE"=>"string",
       "REQUIRED"=>true}},
   "THROWS"=>"NOACCESS,VALIDATION"},
 "linode.config.delete"=>
  {"DESCRIPTION"=>"Deletes a Linode Configuration Profile.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ConfigID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "nodebalancer.config.delete"=>
  {"DESCRIPTION"=>"Deletes a NodeBalancer's Config",
   "PARAMETERS"=>
    {"ConfigID"=>
      {"DESCRIPTION"=>"The NodeBalancerID to delete",
       "TYPE"=>"numeric",
       "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "linode.boot"=>
  {"DESCRIPTION"=>
    "Issues a boot job for the provided ConfigID.  If no ConfigID is provided boots the last used configuration profile, or the first configuration profile if this Linode has never been booted.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ConfigID"=>
      {"DESCRIPTION"=>
        "The ConfigID to boot, available from linode.config.list().",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND"},
 "avail.distributions"=>
  {"DESCRIPTION"=>"Returns a list of available Linux Distributions.",
   "PARAMETERS"=>
    {"DistributionID"=>
      {"DESCRIPTION"=>"Limits the results to the specified DistributionID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>""},
 "linode.disk.duplicate"=>
  {"DESCRIPTION"=>"Performs a bit-for-bit copy of a disk image.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "DiskID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "avail.kernels"=>
  {"DESCRIPTION"=>"List available kernels.",
   "PARAMETERS"=>
    {"isXen"=>
      {"DESCRIPTION"=>"Limits the results to show only Xen kernels",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "KernelID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false}},
   "THROWS"=>""},
 "stackscript.update"=>
  {"DESCRIPTION"=>"Update a StackScript.",
   "PARAMETERS"=>
    {"rev_note"=>{"DESCRIPTION"=>"", "TYPE"=>"string", "REQUIRED"=>false},
     "script"=>
      {"DESCRIPTION"=>"The actual script",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Description"=>{"DESCRIPTION"=>"", "TYPE"=>"string", "REQUIRED"=>false},
     "DistributionIDList"=>
      {"DESCRIPTION"=>
        "Comma delimited list of DistributionIDs that this script works on ",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Label"=>
      {"DESCRIPTION"=>"The Label for this StackScript",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "isPublic"=>
      {"DESCRIPTION"=>
        "Whether this StackScript is published in the Library, for everyone to use",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "StackScriptID"=>
      {"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "nodebalancer.node.create"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"Label"=>
      {"DESCRIPTION"=>"This backend Node's label",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "Mode"=>
      {"DESCRIPTION"=>
        "The connections mode for this node.  One of 'accept', 'reject', or 'drain'",
       "default"=>"accept",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ConfigID"=>
      {"DESCRIPTION"=>"The parent ConfigID to attach this Node to",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "Weight"=>
      {"DESCRIPTION"=>
        "Load balancing weight, 1-255. Higher means more connections.",
       "default"=>100,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Address"=>
      {"DESCRIPTION"=>
        "The address:port combination used to communicate with this Node",
       "TYPE"=>"string",
       "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "account.info"=>
  {"DESCRIPTION"=>
    "Shows information about your account such as the date your account was opened as well as your network utilization for the current month in gigabytes.",
   "PARAMETERS"=>{},
   "THROWS"=>""},
 "linode.ip.addprivate"=>
  {"DESCRIPTION"=>
    "Assigns a Private IP to a Linode.  Returns the IPAddressID that was added.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "linode.disk.resize"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"size"=>
      {"DESCRIPTION"=>"The requested new size of this Disk in MB",
       "TYPE"=>"numeric",
       "REQUIRED"=>true},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "DiskID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.mutate"=>
  {"DESCRIPTION"=>"Upgrades a Linode to its next generation.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "nodebalancer.update"=>
  {"DESCRIPTION"=>"Updates a NodeBalancer's properties",
   "PARAMETERS"=>
    {"Label"=>
      {"DESCRIPTION"=>"This NodeBalancer's label",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ClientConnThrottle"=>
      {"DESCRIPTION"=>
        "To help mitigate abuse, throttle connections per second, per client IP. 0 to disable. Max of 20.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "NodeBalancerID"=>
      {"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "nodebalancer.config.list"=>
  {"DESCRIPTION"=>
    "Returns a list of NodeBalancers this user has access or delete to, including their properties",
   "PARAMETERS"=>
    {"NodeBalancerID"=>
      {"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "ConfigID"=>
      {"DESCRIPTION"=>"Limits the list to the specified ConfigID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>""},
 "linode.config.update"=>
  {"DESCRIPTION"=>"Updates a Linode Configuration Profile.",
   "PARAMETERS"=>
    {"RootDeviceCustom"=>
      {"DESCRIPTION"=>"A custom root device setting.",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Comments"=>
      {"DESCRIPTION"=>"Comments you wish to save along with this profile",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "devtmpfs_automount"=>
      {"DESCRIPTION"=>
        "Controls if pv_ops kernels should automount devtmpfs at boot. ",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "helper_disableUpdateDB"=>
      {"DESCRIPTION"=>"Enable the disableUpdateDB filesystem helper",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "Label"=>
      {"DESCRIPTION"=>"The Label for this profile",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "ConfigID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "DiskList"=>
      {"DESCRIPTION"=>
        "A comma delimited list of DiskIDs; position reflects device node.  The 9th element for specifying the initrd.",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "RunLevel"=>
      {"DESCRIPTION"=>"One of 'default', 'single', 'binbash' ",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "RootDeviceRO"=>
      {"DESCRIPTION"=>
        "Enables the 'ro' kernel flag.  Modern distros want this. ",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "RootDeviceNum"=>
      {"DESCRIPTION"=>
        "Which device number (1-8) that contains the root partition.  0 to utilize RootDeviceCustom.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "helper_xen"=>
      {"DESCRIPTION"=>
        "Enable the Xen filesystem helper.  Corrects fstab and inittab/upstart entries depending on the kernel you're booting.  You want this.",
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "RAMLimit"=>
      {"DESCRIPTION"=>"RAMLimit in MB.  0 for max.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "KernelID"=>
      {"DESCRIPTION"=>
        "The KernelID for this profile.  Found in avail.kernels()",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "helper_depmod"=>
      {"DESCRIPTION"=>
        "Creates an empty modprobe file for the kernel you're booting. ",
       "TYPE"=>"boolean",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.shutdown"=>
  {"DESCRIPTION"=>"Issues a shutdown job for a given LinodeID.",
   "PARAMETERS"=>
    {"LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "domain.delete"=>
  {"DESCRIPTION"=>"",
   "PARAMETERS"=>
    {"DomainID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "account.paybalance"=>
  {"DESCRIPTION"=>
    "Pays current balance on file, returning it in the response.",
   "PARAMETERS"=>{},
   "THROWS"=>"CCEXPIRED,CCFAILED,NOACCESS,PAYMENTLIMITER,VALIDATION"},
 "nodebalancer.node.delete"=>
  {"DESCRIPTION"=>"Deletes a Node from a NodeBalancer Config",
   "PARAMETERS"=>
    {"NodeID"=>
      {"DESCRIPTION"=>"The NodeID to delete",
       "TYPE"=>"numeric",
       "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND"},
 "nodebalancer.list"=>
  {"DESCRIPTION"=>
    "Returns a list of NodeBalancers this user has access or delete to, including their properties",
   "PARAMETERS"=>
    {"NodeBalancerID"=>
      {"DESCRIPTION"=>"Limits the list to the specified NodeBalancerID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>""},
 "test.echo"=>
  {"DESCRIPTION"=>"Echos back parameters that were passed in.",
   "PARAMETERS"=>{},
   "THROWS"=>""},
 "stackscript.list"=>
  {"DESCRIPTION"=>"Lists StackScripts you have access to.",
   "PARAMETERS"=>
    {"StackScriptID"=>
      {"DESCRIPTION"=>"Limits the list to the specified StackScriptID",
       "TYPE"=>"numeric",
       "REQUIRED"=>false}},
   "THROWS"=>""},
 "domain.resource.update"=>
  {"DESCRIPTION"=>"Update a domain record.",
   "PARAMETERS"=>
    {"DomainID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "Port"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "ResourceID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "Name"=>
      {"DESCRIPTION"=>
        "The hostname or FQDN.  When Type=MX the subdomain to delegate to the Target MX server.",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Weight"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>false},
     "TTL_sec"=>
      {"DESCRIPTION"=>"TTL.  Leave as 0 to accept our default.",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Priority"=>
      {"DESCRIPTION"=>"Priority for MX and SRV records, 0-255",
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "Target"=>
      {"DESCRIPTION"=>
        "When Type=MX the hostname.  When Type=CNAME the target of the alias.  When Type=TXT the value of the record.  \n\t\tWhen Type=A or AAAA the token of '[remote_addr]' will be substituted with the IP address of the request.",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Protocol"=>
      {"DESCRIPTION"=>
        "The protocol to append to an SRV record.  Ignored on other record types.",
       "TYPE"=>"string",
       "REQUIRED"=>false}},
   "THROWS"=>"NOTFOUND,VALIDATION"},
 "linode.config.create"=>
  {"DESCRIPTION"=>"Creates a Linode Configuration Profile.",
   "PARAMETERS"=>
    {"RootDeviceCustom"=>
      {"DESCRIPTION"=>"A custom root device setting.",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "Comments"=>
      {"DESCRIPTION"=>"Comments you wish to save along with this profile",
       "default"=>"",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "devtmpfs_automount"=>
      {"DESCRIPTION"=>
        "Controls if pv_ops kernels should automount devtmpfs at boot. ",
       "default"=>true,
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "helper_disableUpdateDB"=>
      {"DESCRIPTION"=>"Enable the disableUpdateDB filesystem helper",
       "default"=>true,
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "Label"=>
      {"DESCRIPTION"=>"The Label for this profile",
       "TYPE"=>"string",
       "REQUIRED"=>true},
     "ConfigID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "DiskList"=>
      {"DESCRIPTION"=>
        "A comma delimited list of DiskIDs; position reflects device node.  The 9th element for specifying the initrd.",
       "default"=>",,,,,,,,",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "RunLevel"=>
      {"DESCRIPTION"=>"One of 'default', 'single', 'binbash' ",
       "default"=>"default",
       "TYPE"=>"string",
       "REQUIRED"=>false},
     "RootDeviceRO"=>
      {"DESCRIPTION"=>
        "Enables the 'ro' kernel flag.  Modern distros want this. ",
       "default"=>true,
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "RootDeviceNum"=>
      {"DESCRIPTION"=>
        "Which device number (1-8) that contains the root partition.  0 to utilize RootDeviceCustom.",
       "default"=>1,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "helper_xen"=>
      {"DESCRIPTION"=>
        "Enable the Xen filesystem helper.  Corrects fstab and inittab/upstart entries depending on the kernel you're booting.  You want this.",
       "default"=>true,
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "RAMLimit"=>
      {"DESCRIPTION"=>"RAMLimit in MB.  0 for max.",
       "default"=>0,
       "TYPE"=>"numeric",
       "REQUIRED"=>false},
     "LinodeID"=>{"DESCRIPTION"=>"", "TYPE"=>"numeric", "REQUIRED"=>true},
     "helper_depmod"=>
      {"DESCRIPTION"=>
        "Creates an empty modprobe file for the kernel you're booting. ",
       "default"=>true,
       "TYPE"=>"boolean",
       "REQUIRED"=>false},
     "KernelID"=>
      {"DESCRIPTION"=>
        "The KernelID for this profile.  Found in avail.kernels()",
       "TYPE"=>"numeric",
       "REQUIRED"=>true}},
   "THROWS"=>"NOTFOUND,VALIDATION"}}

end
