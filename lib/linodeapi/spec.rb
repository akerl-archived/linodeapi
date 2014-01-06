##
# Dynamically updated spec from the api.spec call
# rubocop:disable all

module LinodeAPI
  SPEC =
{:linode=>
  {:type=>:group,
   :subs=>
    {:list=>
      {:type=>:call,
       :desc=>
        "Returns a list of all Linodes user has access or delete to, including some properties",
       :throws=>[],
       :params=>
        {"LinodeID"=>
          {:desc=>"Limits the list to the specified LinodeID",
           :type=>"numeric",
           :required=>false}}},
     :disk=>
      {:type=>:group,
       :subs=>
        {:delete=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "DiskID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
         :update=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"Label"=>
              {:desc=>"The display label for this Disk",
               :type=>"string",
               :required=>false},
             "isReadOnly"=>
              {:desc=>"Enable forced read-only for this Disk",
               :type=>"boolean",
               :required=>false},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>false},
             "DiskID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
         :create=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"Label"=>
              {:desc=>"The display label for this Disk",
               :type=>"string",
               :required=>true},
             "Size"=>
              {:desc=>"The size in MB of this Disk.",
               :type=>"numeric",
               :required=>true},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "Type"=>
              {:desc=>
                "The formatted type of this disk.  Valid types are: ext3, swap, raw",
               :type=>"string",
               :required=>true}}},
         :createfromstackscript=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"StackScriptUDFResponses"=>
              {:desc=>
                "JSON encoded name/value pairs, answering this StackScript's User Defined Fields",
               :type=>"string",
               :required=>"yes"},
             "DistributionID"=>
              {:desc=>
                "Which Distribution to apply this StackScript to.  Must be one from the script's DistributionIDList",
               :type=>"numeric",
               :required=>true},
             "rootPass"=>
              {:desc=>"The root user's password",
               :type=>"string",
               :required=>true},
             "Label"=>
              {:desc=>"The label of this new disk image",
               :type=>"string",
               :required=>true},
             "Size"=>
              {:desc=>"Size of this disk image in MB",
               :type=>"numeric",
               :required=>true},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "StackScriptID"=>
              {:desc=>"The StackScript to create this image from",
               :type=>"numeric",
               :required=>"yes"}}},
         :list=>
          {:type=>:call,
           :desc=>"",
           :throws=>[],
           :params=>
            {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "DiskID"=>{:desc=>"", :type=>"numeric", :required=>false}}},
         :createfromdistribution=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"rootSSHKey"=>
              {:desc=>
                "Optionally sets this string into /root/.ssh/authorized_keys upon distribution configuration.",
               :type=>"string",
               :required=>false},
             "Label"=>
              {:desc=>"The label of this new disk image",
               :type=>"string",
               :required=>true},
             "Size"=>
              {:desc=>"Size of this disk image in MB",
               :type=>"numeric",
               :required=>true},
             "DistributionID"=>
              {:desc=>
                "The DistributionID to create this disk from.  Found in avail.distributions()",
               :type=>"numeric",
               :required=>true},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "rootPass"=>
              {:desc=>"The root user's password",
               :type=>"string",
               :required=>true}}},
         :duplicate=>
          {:type=>:call,
           :desc=>"Performs a bit-for-bit copy of a disk image.",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "DiskID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
         :resize=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"size"=>
              {:desc=>"The requested new size of this Disk in MB",
               :type=>"numeric",
               :required=>true},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "DiskID"=>{:desc=>"", :type=>"numeric", :required=>true}}}}},
     :webconsoletoken=>
      {:type=>:call,
       :desc=>
        "Generates a console token starting a web console LISH session for the requesting IP",
       :throws=>["NOTFOUND", "VALIDATION"],
       :params=>{"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
     :create=>
      {:type=>:call,
       :desc=>
        "Creates a Linode and assigns you full privileges. There is a 75-linodes-per-hour limiter.",
       :throws=>
        ["NOACCESS",
         "CCFAILED",
         "VALIDATION",
         "LINODELIMITER",
         "ACCOUNTLIMIT"],
       :params=>
        {"PlanID"=>
          {:desc=>"The desired PlanID available from avail.LinodePlans()",
           :type=>"numeric",
           :required=>true},
         "PaymentTerm"=>
          {:desc=>
            "Subscription term in months for non-metered customers.  One of: 1, 12, or 24",
           :type=>"numeric",
           :required=>false},
         "DatacenterID"=>
          {:desc=>
            "The DatacenterID from avail.datacenters() where you wish to place this new Linode",
           :type=>"numeric",
           :required=>true}}},
     :update=>
      {:type=>:call,
       :desc=>"Updates a Linode's properties.",
       :throws=>["NOTFOUND", "VALIDATION"],
       :params=>
        {"ms_ssh_user"=>{:desc=>"", :type=>"string", :required=>false},
         "Alert_cpu_enabled"=>
          {:desc=>"Enable the cpu usage email alert",
           :type=>"boolean",
           :required=>false},
         "Alert_bwin_enabled"=>
          {:desc=>"Enable the incoming bandwidth email alert",
           :type=>"boolean",
           :required=>false},
         "Alert_cpu_threshold"=>
          {:desc=>"CPU Alert threshold, percentage 0-800",
           :type=>"numeric",
           :required=>false},
         "Alert_bwquota_enabled"=>
          {:desc=>"Enable the bw quote email alert",
           :type=>"boolean",
           :required=>false},
         "backupWindow"=>{:desc=>"", :type=>"numeric", :required=>false},
         "Alert_diskio_threshold"=>
          {:desc=>"IO ops/sec", :type=>"numeric", :required=>false},
         "backupWeeklyDay"=>{:desc=>"", :type=>"numeric", :required=>false},
         "Label"=>
          {:desc=>"This Linode's label", :type=>"string", :required=>false},
         "watchdog"=>
          {:desc=>"Enable the Lassie shutdown watchdog",
           :type=>"boolean",
           :required=>false},
         "Alert_diskio_enabled"=>
          {:desc=>"Enable the disk IO email alert",
           :type=>"boolean",
           :required=>false},
         "ms_ssh_port"=>{:desc=>"", :type=>"numeric", :required=>false},
         "lpm_displayGroup"=>
          {:desc=>"Display group in the Linode list inside the Linode Manager",
           :type=>"string",
           :required=>false},
         "ms_ssh_disabled"=>{:desc=>"", :type=>"boolean", :required=>false},
         "Alert_bwquota_threshold"=>
          {:desc=>"Percentage of monthly bw quota",
           :type=>"numeric",
           :required=>false},
         "ms_ssh_ip"=>{:desc=>"", :type=>"string", :required=>false},
         "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
         "Alert_bwin_threshold"=>
          {:desc=>"Mb/sec", :type=>"numeric", :required=>false},
         "Alert_bwout_threshold"=>
          {:desc=>"Mb/sec", :type=>"numeric", :required=>false},
         "Alert_bwout_enabled"=>
          {:desc=>"Enable the outgoing bandwidth email alert",
           :type=>"boolean",
           :required=>false}}},
     :ip=>
      {:type=>:group,
       :subs=>
        {:list=>
          {:type=>:call,
           :desc=>"Lists a Linode's IP addresses.",
           :throws=>["NOTFOUND"],
           :params=>
            {"IPAddressID"=>
              {:desc=>"If specified, limits the result to this IPAddressID",
               :type=>"numeric",
               :required=>false},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
         :addprivate=>
          {:type=>:call,
           :desc=>
            "Assigns a Private IP to a Linode.  Returns the IPAddressID that was added.",
           :throws=>["NOTFOUND"],
           :params=>
            {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true}}}}},
     :clone=>
      {:type=>:call,
       :desc=>
        "Creates a new Linode, assigns you full privileges, and then clones the specified LinodeID to the new Linode. There is a limit of 5 active clone operations per source Linode.  It is recommended that the source Linode be powered down during the clone.",
       :throws=>
        ["NOACCESS",
         "NOTFOUND",
         "CCFAILED",
         "VALIDATION",
         "LINODELIMITER",
         "ACCOUNTLIMIT"],
       :params=>
        {"DatacenterID"=>
          {:desc=>
            "The DatacenterID from avail.datacenters() where you wish to place this new Linode",
           :type=>"numeric",
           :required=>true},
         "PaymentTerm"=>
          {:desc=>
            "Subscription term in months for non-metered customers.  One of: 1, 12, or 24",
           :type=>"numeric",
           :required=>false},
         "PlanID"=>
          {:desc=>"The desired PlanID available from avail.LinodePlans()",
           :type=>"numeric",
           :required=>true},
         "LinodeID"=>
          {:desc=>"The LinodeID that you want cloned",
           :type=>"numeric",
           :required=>true}}},
     :delete=>
      {:type=>:call,
       :desc=>
        "Immediately removes a Linode from your account and issues a pro-rated credit back to your account, if applicable.  To prevent accidental deletes, this requires the Linode has no Disk images.  You must first delete its disk images.\"",
       :throws=>["NOTFOUND", "LINODENOTEMPTY"],
       :params=>
        {"LinodeID"=>
          {:desc=>"The LinodeID to delete", :type=>"numeric", :required=>true},
         "skipChecks"=>
          {:desc=>"Skips the safety checks and will always delete the Linode",
           :type=>"boolean",
           :required=>false}}},
     :reboot=>
      {:type=>:call,
       :desc=>"Issues a shutdown, and then boot job for a given LinodeID.",
       :throws=>["NOTFOUND"],
       :params=>
        {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
         "ConfigID"=>{:desc=>"", :type=>"numeric", :required=>false}}},
     :config=>
      {:type=>:group,
       :subs=>
        {:list=>
          {:type=>:call,
           :desc=>"Lists a Linode's Configuration Profiles.",
           :throws=>["NOTFOUND"],
           :params=>
            {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "ConfigID"=>{:desc=>"", :type=>"numeric", :required=>false}}},
         :delete=>
          {:type=>:call,
           :desc=>"Deletes a Linode Configuration Profile.",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "ConfigID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
         :update=>
          {:type=>:call,
           :desc=>"Updates a Linode Configuration Profile.",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"RootDeviceCustom"=>
              {:desc=>"A custom root device setting.",
               :type=>"string",
               :required=>false},
             "Comments"=>
              {:desc=>"Comments you wish to save along with this profile",
               :type=>"string",
               :required=>false},
             "devtmpfs_automount"=>
              {:desc=>
                "Controls if pv_ops kernels should automount devtmpfs at boot. ",
               :type=>"boolean",
               :required=>false},
             "helper_disableUpdateDB"=>
              {:desc=>"Enable the disableUpdateDB filesystem helper",
               :type=>"boolean",
               :required=>false},
             "Label"=>
              {:desc=>"The Label for this profile",
               :type=>"string",
               :required=>false},
             "ConfigID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "DiskList"=>
              {:desc=>
                "A comma delimited list of DiskIDs; position reflects device node.  The 9th element for specifying the initrd.",
               :type=>"string",
               :required=>false},
             "RunLevel"=>
              {:desc=>"One of 'default', 'single', 'binbash' ",
               :type=>"string",
               :required=>false},
             "RootDeviceRO"=>
              {:desc=>
                "Enables the 'ro' kernel flag.  Modern distros want this. ",
               :type=>"boolean",
               :required=>false},
             "RootDeviceNum"=>
              {:desc=>
                "Which device number (1-8) that contains the root partition.  0 to utilize RootDeviceCustom.",
               :type=>"numeric",
               :required=>false},
             "helper_xen"=>
              {:desc=>
                "Enable the Xen filesystem helper.  Corrects fstab and inittab/upstart entries depending on the kernel you're booting.  You want this.",
               :type=>"boolean",
               :required=>false},
             "RAMLimit"=>
              {:desc=>"RAMLimit in MB.  0 for max.",
               :type=>"numeric",
               :required=>false},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>false},
             "KernelID"=>
              {:desc=>
                "The KernelID for this profile.  Found in avail.kernels()",
               :type=>"numeric",
               :required=>false},
             "helper_depmod"=>
              {:desc=>
                "Creates an empty modprobe file for the kernel you're booting. ",
               :type=>"boolean",
               :required=>false}}},
         :create=>
          {:type=>:call,
           :desc=>"Creates a Linode Configuration Profile.",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"RootDeviceCustom"=>
              {:desc=>"A custom root device setting.",
               :type=>"string",
               :required=>false},
             "Comments"=>
              {:desc=>"Comments you wish to save along with this profile",
               :type=>"string",
               :required=>false},
             "devtmpfs_automount"=>
              {:desc=>
                "Controls if pv_ops kernels should automount devtmpfs at boot. ",
               :type=>"boolean",
               :required=>false},
             "helper_disableUpdateDB"=>
              {:desc=>"Enable the disableUpdateDB filesystem helper",
               :type=>"boolean",
               :required=>false},
             "Label"=>
              {:desc=>"The Label for this profile",
               :type=>"string",
               :required=>true},
             "DiskList"=>
              {:desc=>
                "A comma delimited list of DiskIDs; position reflects device node.  The 9th element for specifying the initrd.",
               :type=>"string",
               :required=>false},
             "RunLevel"=>
              {:desc=>"One of 'default', 'single', 'binbash' ",
               :type=>"string",
               :required=>false},
             "RootDeviceRO"=>
              {:desc=>
                "Enables the 'ro' kernel flag.  Modern distros want this. ",
               :type=>"boolean",
               :required=>false},
             "RootDeviceNum"=>
              {:desc=>
                "Which device number (1-8) that contains the root partition.  0 to utilize RootDeviceCustom.",
               :type=>"numeric",
               :required=>false},
             "helper_xen"=>
              {:desc=>
                "Enable the Xen filesystem helper.  Corrects fstab and inittab/upstart entries depending on the kernel you're booting.  You want this.",
               :type=>"boolean",
               :required=>false},
             "RAMLimit"=>
              {:desc=>"RAMLimit in MB.  0 for max.",
               :type=>"numeric",
               :required=>false},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "helper_depmod"=>
              {:desc=>
                "Creates an empty modprobe file for the kernel you're booting. ",
               :type=>"boolean",
               :required=>false},
             "KernelID"=>
              {:desc=>
                "The KernelID for this profile.  Found in avail.kernels()",
               :type=>"numeric",
               :required=>true}}}}},
     :resize=>
      {:type=>:call,
       :desc=>
        "Resizes a Linode from one plan to another.  Immediately shuts the Linode down, charges/credits the account, and issue a migration to another host server.",
       :throws=>["NOTFOUND", "CCFAILED", "VALIDATION"],
       :params=>
        {"PlanID"=>
          {:desc=>"The desired PlanID available from avail.LinodePlans()",
           :type=>"numeric",
           :required=>true},
         "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
     :job=>
      {:type=>:group,
       :subs=>
        {:list=>
          {:type=>:call,
           :desc=>"",
           :throws=>[],
           :params=>
            {"JobID"=>
              {:desc=>"Limits the list to the specified JobID",
               :type=>"numeric",
               :required=>false},
             "LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "pendingOnly"=>
              {:desc=>"", :type=>"boolean", :required=>false}}}}},
     :boot=>
      {:type=>:call,
       :desc=>
        "Issues a boot job for the provided ConfigID.  If no ConfigID is provided boots the last used configuration profile, or the first configuration profile if this Linode has never been booted.",
       :throws=>["NOTFOUND"],
       :params=>
        {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
         "ConfigID"=>
          {:desc=>"The ConfigID to boot, available from linode.config.list().",
           :type=>"numeric",
           :required=>false}}},
     :mutate=>
      {:type=>:call,
       :desc=>"Upgrades a Linode to its next generation.",
       :throws=>["NOTFOUND", "VALIDATION"],
       :params=>{"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
     :shutdown=>
      {:type=>:call,
       :desc=>"Issues a shutdown job for a given LinodeID.",
       :throws=>["NOTFOUND"],
       :params=>
        {"LinodeID"=>{:desc=>"", :type=>"numeric", :required=>true}}}}},
 :nodebalancer=>
  {:type=>:group,
   :subs=>
    {:node=>
      {:type=>:group,
       :subs=>
        {:update=>
          {:type=>:call,
           :desc=>"Updates a Node's properties",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"Label"=>
              {:desc=>"This backend Node's label",
               :type=>"string",
               :required=>false},
             "NodeID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "Mode"=>
              {:desc=>
                "The connections mode for this node.  One of 'accept', 'reject', or 'drain'",
               :type=>"string",
               :required=>false},
             "Weight"=>
              {:desc=>
                "Load balancing weight, 1-255. Higher means more connections.",
               :type=>"numeric",
               :required=>false},
             "Address"=>
              {:desc=>
                "The address:port combination used to communicate with this Node",
               :type=>"string",
               :required=>false}}},
         :list=>
          {:type=>:call,
           :desc=>
            "Returns a list of Nodes associated with a NodeBalancer Config",
           :throws=>[],
           :params=>
            {"NodeID"=>
              {:desc=>"Limits the list to the specified NodeID",
               :type=>"numeric",
               :required=>false},
             "ConfigID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
         :create=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"Label"=>
              {:desc=>"This backend Node's label",
               :type=>"string",
               :required=>true},
             "Mode"=>
              {:desc=>
                "The connections mode for this node.  One of 'accept', 'reject', or 'drain'",
               :type=>"string",
               :required=>false},
             "ConfigID"=>
              {:desc=>"The parent ConfigID to attach this Node to",
               :type=>"numeric",
               :required=>true},
             "Weight"=>
              {:desc=>
                "Load balancing weight, 1-255. Higher means more connections.",
               :type=>"numeric",
               :required=>false},
             "Address"=>
              {:desc=>
                "The address:port combination used to communicate with this Node",
               :type=>"string",
               :required=>true}}},
         :delete=>
          {:type=>:call,
           :desc=>"Deletes a Node from a NodeBalancer Config",
           :throws=>["NOTFOUND"],
           :params=>
            {"NodeID"=>
              {:desc=>"The NodeID to delete",
               :type=>"numeric",
               :required=>true}}}}},
     :create=>
      {:type=>:call,
       :desc=>"",
       :throws=>["NOACCESS", "CCFAILED", "VALIDATION"],
       :params=>
        {"Label"=>
          {:desc=>"This NodeBalancer's label",
           :type=>"string",
           :required=>false},
         "ClientConnThrottle"=>
          {:desc=>
            "To help mitigate abuse, throttle connections per second, per client IP. 0 to disable. Max of 20.",
           :type=>"numeric",
           :required=>false},
         "DatacenterID"=>
          {:desc=>
            "The DatacenterID from avail.datacenters() where you wish to place this new NodeBalancer",
           :type=>"numeric",
           :required=>true},
         "PaymentTerm"=>
          {:desc=>"Subscription term in months.  One of: 0, 1, 12, or 24",
           :type=>"numeric",
           :required=>true}}},
     :delete=>
      {:type=>:call,
       :desc=>
        "Immediately removes a NodeBalancer from your account and issues a pro-rated credit back to your account, if applicable.",
       :throws=>["NOTFOUND"],
       :params=>
        {"NodeBalancerID"=>
          {:desc=>"The NodeBalancerID to delete",
           :type=>"numeric",
           :required=>true}}},
     :config=>
      {:type=>:group,
       :subs=>
        {:create=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"Stickiness"=>
              {:desc=>
                "Session persistence.  One of 'none', 'table', 'http_cookie'",
               :type=>"string",
               :required=>false},
             "check_path"=>
              {:desc=>"When check=http, the path to request",
               :type=>"string",
               :required=>false},
             "check_body"=>
              {:desc=>
                "When check=http_body, a regex against the expected result body",
               :type=>"string",
               :required=>false},
             "check_interval"=>
              {:desc=>"Seconds between health check probes.  2-3600",
               :type=>"numeric",
               :required=>false},
             "Algorithm"=>
              {:desc=>
                "Balancing algorithm.  One of 'roundrobin', 'leastconn', 'source'",
               :type=>"string",
               :required=>false},
             "NodeBalancerID"=>
              {:desc=>"The parent NodeBalancer's ID",
               :type=>"numeric",
               :required=>true},
             "check_attempts"=>
              {:desc=>
                "Number of failed probes before taking a node out of rotation. 1-30",
               :type=>"string",
               :required=>false},
             "Port"=>
              {:desc=>"Port to bind to on the public interfaces. 1-65534",
               :type=>"numeric",
               :required=>false},
             "check"=>
              {:desc=>
                "Perform active health checks on the backend nodes.  One of 'connection', 'http', 'http_body'",
               :type=>"string",
               :required=>false},
             "ssl_key"=>
              {:desc=>
                "Unpassphrased private key for the SSL certificate when protocol is 'https'",
               :type=>"string",
               :required=>false},
             "Protocol"=>
              {:desc=>"Either 'tcp', 'http', or 'https'",
               :type=>"string",
               :required=>false},
             "check_timeout"=>
              {:desc=>
                "Seconds to wait before considering the probe a failure. 1-30.  Must be less than check_interval.",
               :type=>"string",
               :required=>false},
             "ssl_cert"=>
              {:desc=>
                "SSL certificate served by the NodeBalancer when the protocol is 'https'",
               :type=>"string",
               :required=>false}}},
         :update=>
          {:type=>:call,
           :desc=>"Updates a Config's properties",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"Stickiness"=>
              {:desc=>
                "Session persistence.  One of 'none', 'table', 'http_cookie'",
               :type=>"string",
               :required=>false},
             "check_path"=>
              {:desc=>"When check=http, the path to request",
               :type=>"string",
               :required=>false},
             "check_body"=>
              {:desc=>
                "When check=http_body, a regex against the expected result body",
               :type=>"string",
               :required=>false},
             "check_interval"=>
              {:desc=>"Seconds between health check probes.  2-3600",
               :type=>"numeric",
               :required=>false},
             "Algorithm"=>
              {:desc=>
                "Balancing algorithm.  One of 'roundrobin', 'leastconn', 'source'",
               :type=>"string",
               :required=>false},
             "ConfigID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "check_attempts"=>
              {:desc=>
                "Number of failed probes before taking a node out of rotation. 1-30",
               :type=>"string",
               :required=>false},
             "Port"=>
              {:desc=>"Port to bind to on the public interfaces. 1-65534",
               :type=>"numeric",
               :required=>false},
             "check"=>
              {:desc=>
                "Perform active health checks on the backend nodes.  One of 'connection', 'http', 'http_body'",
               :type=>"string",
               :required=>false},
             "ssl_key"=>
              {:desc=>
                "Unpassphrased private key for the SSL certificate when protocol is 'https'",
               :type=>"string",
               :required=>false},
             "Protocol"=>
              {:desc=>"Either 'tcp', 'http', or 'https'",
               :type=>"string",
               :required=>false},
             "check_timeout"=>
              {:desc=>
                "Seconds to wait before considering the probe a failure. 1-30.  Must be less than check_interval.",
               :type=>"string",
               :required=>false},
             "ssl_cert"=>
              {:desc=>
                "SSL certificate served by the NodeBalancer when the protocol is 'https'",
               :type=>"string",
               :required=>false}}},
         :delete=>
          {:type=>:call,
           :desc=>"Deletes a NodeBalancer's Config",
           :throws=>["NOTFOUND"],
           :params=>
            {"ConfigID"=>
              {:desc=>"The NodeBalancerID to delete",
               :type=>"numeric",
               :required=>true}}},
         :list=>
          {:type=>:call,
           :desc=>
            "Returns a list of NodeBalancers this user has access or delete to, including their properties",
           :throws=>[],
           :params=>
            {"NodeBalancerID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "ConfigID"=>
              {:desc=>"Limits the list to the specified ConfigID",
               :type=>"numeric",
               :required=>false}}}}},
     :update=>
      {:type=>:call,
       :desc=>"Updates a NodeBalancer's properties",
       :throws=>["NOTFOUND", "VALIDATION"],
       :params=>
        {"Label"=>
          {:desc=>"This NodeBalancer's label",
           :type=>"string",
           :required=>false},
         "ClientConnThrottle"=>
          {:desc=>
            "To help mitigate abuse, throttle connections per second, per client IP. 0 to disable. Max of 20.",
           :type=>"numeric",
           :required=>false},
         "NodeBalancerID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
     :list=>
      {:type=>:call,
       :desc=>
        "Returns a list of NodeBalancers this user has access or delete to, including their properties",
       :throws=>[],
       :params=>
        {"NodeBalancerID"=>
          {:desc=>"Limits the list to the specified NodeBalancerID",
           :type=>"numeric",
           :required=>false}}}}},
 :domain=>
  {:type=>:group,
   :subs=>
    {:update=>
      {:type=>:call,
       :desc=>"Update a domain record.",
       :throws=>["NOTFOUND", "VALIDATION"],
       :params=>
        {"DomainID"=>{:desc=>"", :type=>"numeric", :required=>true},
         "Description"=>
          {:desc=>"Currently undisplayed.", :type=>"string", :required=>false},
         "Retry_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "Expire_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "status"=>
          {:desc=>"0, 1, or 2 (disabled, active, edit mode)",
           :type=>"numeric",
           :required=>false},
         "master_ips"=>
          {:desc=>
            "When type=slave, the zone's master DNS servers list, semicolon separated ",
           :type=>"string",
           :required=>false},
         "Refresh_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "lpm_displayGroup"=>
          {:desc=>
            "Display group in the Domain list inside the Linode DNS Manager",
           :type=>"string",
           :required=>false},
         "SOA_Email"=>
          {:desc=>"Required when type=master",
           :type=>"string",
           :required=>false},
         "TTL_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "Domain"=>
          {:desc=>"The zone's name", :type=>"string", :required=>false},
         "Type"=>{:desc=>"master or slave", :type=>"string", :required=>false},
         "axfr_ips"=>
          {:desc=>
            "IP addresses allowed to AXFR the entire zone, semicolon separated",
           :type=>"string",
           :required=>false}}},
     :create=>
      {:type=>:call,
       :desc=>"Create a domain record.",
       :throws=>["NOACCESS", "VALIDATION"],
       :params=>
        {"SOA_Email"=>
          {:desc=>"Required when type=master",
           :type=>"string",
           :required=>false},
         "Description"=>
          {:desc=>"Currently undisplayed.", :type=>"string", :required=>false},
         "TTL_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "Retry_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "Expire_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "status"=>
          {:desc=>"0, 1, or 2 (disabled, active, edit mode)",
           :type=>"numeric",
           :required=>false},
         "Domain"=>
          {:desc=>"The zone's name", :type=>"string", :required=>true},
         "master_ips"=>
          {:desc=>
            "When type=slave, the zone's master DNS servers list, semicolon separated ",
           :type=>"string",
           :required=>false},
         "Refresh_sec"=>{:desc=>"", :type=>"numeric", :required=>false},
         "lpm_displayGroup"=>
          {:desc=>
            "Display group in the Domain list inside the Linode DNS Manager",
           :type=>"string",
           :required=>false},
         "Type"=>{:desc=>"master or slave", :type=>"string", :required=>true},
         "axfr_ips"=>
          {:desc=>
            "IP addresses allowed to AXFR the entire zone, semicolon separated",
           :type=>"string",
           :required=>false}}},
     :resource=>
      {:type=>:group,
       :subs=>
        {:delete=>
          {:type=>:call,
           :desc=>"",
           :throws=>["NOTFOUND"],
           :params=>
            {"DomainID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "ResourceID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
         :list=>
          {:type=>:call,
           :desc=>"",
           :throws=>[],
           :params=>
            {"DomainID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "ResourceID"=>{:desc=>"", :type=>"numeric", :required=>false}}},
         :create=>
          {:type=>:call,
           :desc=>"Create a domain record.",
           :throws=>["NOACCESS", "VALIDATION"],
           :params=>
            {"DomainID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "Port"=>{:desc=>"", :type=>"numeric", :required=>false},
             "Name"=>
              {:desc=>
                "The hostname or FQDN.  When Type=MX the subdomain to delegate to the Target MX server.",
               :type=>"string",
               :required=>false},
             "Weight"=>{:desc=>"", :type=>"numeric", :required=>false},
             "TTL_sec"=>
              {:desc=>"TTL.  Leave as 0 to accept our default.",
               :type=>"numeric",
               :required=>false},
             "Priority"=>
              {:desc=>"Priority for MX and SRV records, 0-255",
               :type=>"numeric",
               :required=>false},
             "Target"=>
              {:desc=>
                "When Type=MX the hostname.  When Type=CNAME the target of the alias.  When Type=TXT the value of the record.  \n\t\tWhen Type=A or AAAA the token of '[remote_addr]' will be substituted with the IP address of the request.",
               :type=>"string",
               :required=>false},
             "Protocol"=>
              {:desc=>
                "The protocol to append to an SRV record.  Ignored on other record types.",
               :type=>"string",
               :required=>false},
             "Type"=>
              {:desc=>"One of: NS, MX, A, AAAA, CNAME, TXT, or SRV",
               :type=>"string",
               :required=>true}}},
         :update=>
          {:type=>:call,
           :desc=>"Update a domain record.",
           :throws=>["NOTFOUND", "VALIDATION"],
           :params=>
            {"DomainID"=>{:desc=>"", :type=>"numeric", :required=>false},
             "Port"=>{:desc=>"", :type=>"numeric", :required=>false},
             "ResourceID"=>{:desc=>"", :type=>"numeric", :required=>true},
             "Name"=>
              {:desc=>
                "The hostname or FQDN.  When Type=MX the subdomain to delegate to the Target MX server.",
               :type=>"string",
               :required=>false},
             "Weight"=>{:desc=>"", :type=>"numeric", :required=>false},
             "TTL_sec"=>
              {:desc=>"TTL.  Leave as 0 to accept our default.",
               :type=>"numeric",
               :required=>false},
             "Priority"=>
              {:desc=>"Priority for MX and SRV records, 0-255",
               :type=>"numeric",
               :required=>false},
             "Target"=>
              {:desc=>
                "When Type=MX the hostname.  When Type=CNAME the target of the alias.  When Type=TXT the value of the record.  \n\t\tWhen Type=A or AAAA the token of '[remote_addr]' will be substituted with the IP address of the request.",
               :type=>"string",
               :required=>false},
             "Protocol"=>
              {:desc=>
                "The protocol to append to an SRV record.  Ignored on other record types.",
               :type=>"string",
               :required=>false}}}}},
     :list=>
      {:type=>:call,
       :desc=>"Lists domains you have access to.",
       :throws=>[],
       :params=>
        {"DomainID"=>
          {:desc=>"Limits the list to the specified DomainID",
           :type=>"numeric",
           :required=>false}}},
     :delete=>
      {:type=>:call,
       :desc=>"",
       :throws=>["NOTFOUND"],
       :params=>
        {"DomainID"=>{:desc=>"", :type=>"numeric", :required=>true}}}}},
 :avail=>
  {:type=>:group,
   :subs=>
    {:datacenters=>
      {:type=>:call,
       :desc=>"Returns a list of Linode data center facilities.",
       :throws=>[],
       :params=>{}},
     :linodeplans=>
      {:type=>:call,
       :desc=>
        "Returns a structure of Linode PlanIDs containing the Plan label and the availability in each Datacenter. Please note, this method is deprecated and will be removed in the future.",
       :throws=>[],
       :params=>
        {"PlanID"=>
          {:desc=>"Limits the list to the specified PlanID",
           :type=>"numeric",
           :required=>false}}},
     :stackscripts=>
      {:type=>:call,
       :desc=>"Returns a list of available public StackScripts.",
       :throws=>[],
       :params=>
        {"DistributionID"=>
          {:desc=>
            "Limit the results to StackScripts that can be applied to this DistributionID",
           :type=>"numeric",
           :required=>false},
         "keywords"=>
          {:desc=>"Search terms", :type=>"string", :required=>false},
         "DistributionVendor"=>
          {:desc=>"Debian, Ubuntu, Fedora, etc.",
           :type=>"string",
           :required=>false}}},
     :distributions=>
      {:type=>:call,
       :desc=>"Returns a list of available Linux Distributions.",
       :throws=>[],
       :params=>
        {"DistributionID"=>
          {:desc=>"Limits the results to the specified DistributionID",
           :type=>"numeric",
           :required=>false}}},
     :kernels=>
      {:type=>:call,
       :desc=>"List available kernels.",
       :throws=>[],
       :params=>
        {"isXen"=>
          {:desc=>"Limits the results to show only Xen kernels",
           :type=>"boolean",
           :required=>false},
         "KernelID"=>{:desc=>"", :type=>"numeric", :required=>false}}}}},
 :account=>
  {:type=>:group,
   :subs=>
    {:estimateinvoice=>
      {:type=>:call,
       :desc=>
        "Estimates the invoice for adding a new Linode or NodeBalancer as well as resizing a Linode. This returns two fields: PRICE which is the estimated cost of the invoice, and INVOICE_TO which is the date invoice would be though with timezone set to America/New_York",
       :throws=>["VALIDATION"],
       :params=>
        {"PaymentTerm"=>
          {:desc=>
            "Subscription term in months. One of: 1, 12, or 24. This is required for modes 'linode_new' and 'nodebalancer_new'.",
           :type=>"numeric",
           :required=>false},
         "mode"=>
          {:desc=>
            "This is one of the following options: 'linode_new', 'linode_resize', or 'nodebalancer_new'.",
           :type=>"string",
           :required=>true},
         "PlanID"=>
          {:desc=>
            "The desired PlanID available from avail.LinodePlans(). This is required for modes 'linode_new' and 'linode_resize'.",
           :type=>"numeric",
           :required=>false},
         "LinodeID"=>
          {:desc=>
            "This is the LinodeID you want to resize and is required for mode 'linode_resize'.",
           :type=>"numeric",
           :required=>false}}},
     :updatecard=>
      {:type=>:call,
       :desc=>"",
       :throws=>[],
       :params=>
        {"ccExpMonth"=>{:desc=>"", :type=>"numeric", :required=>true},
         "ccExpYear"=>{:desc=>"", :type=>"numeric", :required=>true},
         "ccNumber"=>{:desc=>"", :type=>"numeric", :required=>true}}},
     :info=>
      {:type=>:call,
       :desc=>
        "Shows information about your account such as the date your account was opened as well as your network utilization for the current month in gigabytes.",
       :throws=>[],
       :params=>{}},
     :paybalance=>
      {:type=>:call,
       :desc=>"Pays current balance on file, returning it in the response.",
       :throws=>
        ["CCEXPIRED", "CCFAILED", "NOACCESS", "PAYMENTLIMITER", "VALIDATION"],
       :params=>{}}}},
 :stackscript=>
  {:type=>:group,
   :subs=>
    {:create=>
      {:type=>:call,
       :desc=>"Create a StackScript.",
       :throws=>["NOACCESS", "VALIDATION"],
       :params=>
        {"Label"=>
          {:desc=>"The Label for this StackScript",
           :type=>"string",
           :required=>true},
         "rev_note"=>{:desc=>"", :type=>"string", :required=>false},
         "script"=>
          {:desc=>"The actual script", :type=>"string", :required=>true},
         "isPublic"=>
          {:desc=>
            "Whether this StackScript is published in the Library, for everyone to use",
           :type=>"boolean",
           :required=>false},
         "DistributionIDList"=>
          {:desc=>
            "Comma delimited list of DistributionIDs that this script works on ",
           :type=>"string",
           :required=>true},
         "Description"=>{:desc=>"", :type=>"string", :required=>false}}},
     :delete=>
      {:type=>:call,
       :desc=>"",
       :throws=>["NOTFOUND"],
       :params=>
        {"StackScriptID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
     :update=>
      {:type=>:call,
       :desc=>"Update a StackScript.",
       :throws=>["NOTFOUND", "VALIDATION"],
       :params=>
        {"rev_note"=>{:desc=>"", :type=>"string", :required=>false},
         "script"=>
          {:desc=>"The actual script", :type=>"string", :required=>false},
         "Description"=>{:desc=>"", :type=>"string", :required=>false},
         "DistributionIDList"=>
          {:desc=>
            "Comma delimited list of DistributionIDs that this script works on ",
           :type=>"string",
           :required=>false},
         "Label"=>
          {:desc=>"The Label for this StackScript",
           :type=>"string",
           :required=>false},
         "isPublic"=>
          {:desc=>
            "Whether this StackScript is published in the Library, for everyone to use",
           :type=>"boolean",
           :required=>false},
         "StackScriptID"=>{:desc=>"", :type=>"numeric", :required=>true}}},
     :list=>
      {:type=>:call,
       :desc=>"Lists StackScripts you have access to.",
       :throws=>[],
       :params=>
        {"StackScriptID"=>
          {:desc=>"Limits the list to the specified StackScriptID",
           :type=>"numeric",
           :required=>false}}}}},
 :api=>
  {:type=>:group,
   :subs=>
    {:spec=>
      {:type=>:call,
       :desc=>
        "Returns a data structure of the entire Linode API specification.  This method does not require authorization.<br><br>For example: <a target=\"_blank\" href=\"https://api.linode.com/?api_action=api.spec\">https://api.linode.com/?api_action=api.spec</a>",
       :throws=>[],
       :params=>{}}}},
 :user=>
  {:type=>:group,
   :subs=>
    {:getapikey=>
      {:type=>:call,
       :desc=>
        "Returns a user's API key.  If no API key exists, one is generated.  This method does not require an api_key to be passed in.",
       :throws=>[],
       :params=>
        {"password"=>{:desc=>"", :type=>"string", :required=>true},
         "username"=>{:desc=>"", :type=>"string", :required=>true}}}}},
 :test=>
  {:type=>:group,
   :subs=>
    {:echo=>
      {:type=>:call,
       :desc=>"Echos back parameters that were passed in.",
       :throws=>[],
       :params=>{}}}}}

end
