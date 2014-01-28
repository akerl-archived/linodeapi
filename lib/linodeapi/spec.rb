##
# Dynamically updated spec from the api.spec call
# rubocop:disable all

module LinodeAPI
  SPEC =
{:type=>"group",
 :subs=>
  {:linode=>
    {:type=>:group,
     :subs=>
      {:list=>
        {:type=>:call,
         :desc=>
          "Returns a list of all Linodes user has access or delete to, including some properties",
         :throws=>[],
         :params=>
          {:linodeid=>
            {:desc=>"Limits the list to the specified LinodeID",
             :type=>:numeric,
             :required=>false}}},
       :disk=>
        {:type=>:group,
         :subs=>
          {:delete=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :diskid=>{:desc=>"", :type=>:numeric, :required=>true}}},
           :update=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:label=>
                {:desc=>"The display label for this Disk",
                 :type=>:string,
                 :required=>false},
               :isreadonly=>
                {:desc=>"Enable forced read-only for this Disk",
                 :type=>:boolean,
                 :required=>false},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>false},
               :diskid=>{:desc=>"", :type=>:numeric, :required=>true}}},
           :create=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:label=>
                {:desc=>"The display label for this Disk",
                 :type=>:string,
                 :required=>true},
               :size=>
                {:desc=>"The size in MB of this Disk.",
                 :type=>:numeric,
                 :required=>true},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :type=>
                {:desc=>
                  "The formatted type of this disk.  Valid types are: ext3, swap, raw",
                 :type=>:string,
                 :required=>true}}},
           :createfromstackscript=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:stackscriptudfresponses=>
                {:desc=>
                  "JSON encoded name/value pairs, answering this StackScript's User Defined Fields",
                 :type=>:string,
                 :required=>"yes"},
               :distributionid=>
                {:desc=>
                  "Which Distribution to apply this StackScript to.  Must be one from the script's DistributionIDList",
                 :type=>:numeric,
                 :required=>true},
               :rootpass=>
                {:desc=>"The root user's password",
                 :type=>:string,
                 :required=>true},
               :label=>
                {:desc=>"The label of this new disk image",
                 :type=>:string,
                 :required=>true},
               :size=>
                {:desc=>"Size of this disk image in MB",
                 :type=>:numeric,
                 :required=>true},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :stackscriptid=>
                {:desc=>"The StackScript to create this image from",
                 :type=>:numeric,
                 :required=>"yes"}}},
           :list=>
            {:type=>:call,
             :desc=>"",
             :throws=>[],
             :params=>
              {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :diskid=>{:desc=>"", :type=>:numeric, :required=>false}}},
           :createfromdistribution=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:rootsshkey=>
                {:desc=>
                  "Optionally sets this string into /root/.ssh/authorized_keys upon distribution configuration.",
                 :type=>:string,
                 :required=>false},
               :label=>
                {:desc=>"The label of this new disk image",
                 :type=>:string,
                 :required=>true},
               :size=>
                {:desc=>"Size of this disk image in MB",
                 :type=>:numeric,
                 :required=>true},
               :distributionid=>
                {:desc=>
                  "The DistributionID to create this disk from.  Found in avail.distributions()",
                 :type=>:numeric,
                 :required=>true},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :rootpass=>
                {:desc=>"The root user's password",
                 :type=>:string,
                 :required=>true}}},
           :duplicate=>
            {:type=>:call,
             :desc=>"Performs a bit-for-bit copy of a disk image.",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :diskid=>{:desc=>"", :type=>:numeric, :required=>true}}},
           :resize=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:size=>
                {:desc=>"The requested new size of this Disk in MB",
                 :type=>:numeric,
                 :required=>true},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :diskid=>{:desc=>"", :type=>:numeric, :required=>true}}}}},
       :webconsoletoken=>
        {:type=>:call,
         :desc=>
          "Generates a console token starting a web console LISH session for the requesting IP",
         :throws=>["NOTFOUND", "VALIDATION"],
         :params=>{:linodeid=>{:desc=>"", :type=>:numeric, :required=>true}}},
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
          {:planid=>
            {:desc=>"The desired PlanID available from avail.LinodePlans()",
             :type=>:numeric,
             :required=>true},
           :paymentterm=>
            {:desc=>
              "Subscription term in months for non-metered customers.  One of: 1, 12, or 24",
             :type=>:numeric,
             :required=>false},
           :datacenterid=>
            {:desc=>
              "The DatacenterID from avail.datacenters() where you wish to place this new Linode",
             :type=>:numeric,
             :required=>true}}},
       :update=>
        {:type=>:call,
         :desc=>"Updates a Linode's properties.",
         :throws=>["NOTFOUND", "VALIDATION"],
         :params=>
          {:ms_ssh_user=>{:desc=>"", :type=>:string, :required=>false},
           :alert_cpu_enabled=>
            {:desc=>"Enable the cpu usage email alert",
             :type=>:boolean,
             :required=>false},
           :alert_bwin_enabled=>
            {:desc=>"Enable the incoming bandwidth email alert",
             :type=>:boolean,
             :required=>false},
           :alert_cpu_threshold=>
            {:desc=>"CPU Alert threshold, percentage 0-800",
             :type=>:numeric,
             :required=>false},
           :alert_bwquota_enabled=>
            {:desc=>"Enable the bw quote email alert",
             :type=>:boolean,
             :required=>false},
           :backupwindow=>{:desc=>"", :type=>:numeric, :required=>false},
           :alert_diskio_threshold=>
            {:desc=>"IO ops/sec", :type=>:numeric, :required=>false},
           :backupweeklyday=>{:desc=>"", :type=>:numeric, :required=>false},
           :label=>
            {:desc=>"This Linode's label", :type=>:string, :required=>false},
           :watchdog=>
            {:desc=>"Enable the Lassie shutdown watchdog",
             :type=>:boolean,
             :required=>false},
           :alert_diskio_enabled=>
            {:desc=>"Enable the disk IO email alert",
             :type=>:boolean,
             :required=>false},
           :ms_ssh_port=>{:desc=>"", :type=>:numeric, :required=>false},
           :lpm_displaygroup=>
            {:desc=>
              "Display group in the Linode list inside the Linode Manager",
             :type=>:string,
             :required=>false},
           :ms_ssh_disabled=>{:desc=>"", :type=>:boolean, :required=>false},
           :alert_bwquota_threshold=>
            {:desc=>"Percentage of monthly bw quota",
             :type=>:numeric,
             :required=>false},
           :ms_ssh_ip=>{:desc=>"", :type=>:string, :required=>false},
           :linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
           :alert_bwin_threshold=>
            {:desc=>"Mb/sec", :type=>:numeric, :required=>false},
           :alert_bwout_threshold=>
            {:desc=>"Mb/sec", :type=>:numeric, :required=>false},
           :alert_bwout_enabled=>
            {:desc=>"Enable the outgoing bandwidth email alert",
             :type=>:boolean,
             :required=>false}}},
       :ip=>
        {:type=>:group,
         :subs=>
          {:list=>
            {:type=>:call,
             :desc=>"Lists a Linode's IP addresses.",
             :throws=>["NOTFOUND"],
             :params=>
              {:ipaddressid=>
                {:desc=>"If specified, limits the result to this IPAddressID",
                 :type=>:numeric,
                 :required=>false},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>true}}},
           :addprivate=>
            {:type=>:call,
             :desc=>
              "Assigns a Private IP to a Linode.  Returns the IPAddressID that was added.",
             :throws=>["NOTFOUND"],
             :params=>
              {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true}}}}},
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
          {:datacenterid=>
            {:desc=>
              "The DatacenterID from avail.datacenters() where you wish to place this new Linode",
             :type=>:numeric,
             :required=>true},
           :paymentterm=>
            {:desc=>
              "Subscription term in months for non-metered customers.  One of: 1, 12, or 24",
             :type=>:numeric,
             :required=>false},
           :planid=>
            {:desc=>"The desired PlanID available from avail.LinodePlans()",
             :type=>:numeric,
             :required=>true},
           :linodeid=>
            {:desc=>"The LinodeID that you want cloned",
             :type=>:numeric,
             :required=>true}}},
       :delete=>
        {:type=>:call,
         :desc=>
          "Immediately removes a Linode from your account and issues a pro-rated credit back to your account, if applicable.  To prevent accidental deletes, this requires the Linode has no Disk images.  You must first delete its disk images.\"",
         :throws=>["NOTFOUND", "LINODENOTEMPTY"],
         :params=>
          {:linodeid=>
            {:desc=>"The LinodeID to delete",
             :type=>:numeric,
             :required=>true},
           :skipchecks=>
            {:desc=>
              "Skips the safety checks and will always delete the Linode",
             :type=>:boolean,
             :required=>false}}},
       :reboot=>
        {:type=>:call,
         :desc=>"Issues a shutdown, and then boot job for a given LinodeID.",
         :throws=>["NOTFOUND"],
         :params=>
          {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
           :configid=>{:desc=>"", :type=>:numeric, :required=>false}}},
       :config=>
        {:type=>:group,
         :subs=>
          {:list=>
            {:type=>:call,
             :desc=>"Lists a Linode's Configuration Profiles.",
             :throws=>["NOTFOUND"],
             :params=>
              {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :configid=>{:desc=>"", :type=>:numeric, :required=>false}}},
           :delete=>
            {:type=>:call,
             :desc=>"Deletes a Linode Configuration Profile.",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :configid=>{:desc=>"", :type=>:numeric, :required=>true}}},
           :update=>
            {:type=>:call,
             :desc=>"Updates a Linode Configuration Profile.",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:rootdevicecustom=>
                {:desc=>"A custom root device setting.",
                 :type=>:string,
                 :required=>false},
               :comments=>
                {:desc=>"Comments you wish to save along with this profile",
                 :type=>:string,
                 :required=>false},
               :devtmpfs_automount=>
                {:desc=>
                  "Controls if pv_ops kernels should automount devtmpfs at boot. ",
                 :type=>:boolean,
                 :required=>false},
               :helper_disableupdatedb=>
                {:desc=>"Enable the disableUpdateDB filesystem helper",
                 :type=>:boolean,
                 :required=>false},
               :label=>
                {:desc=>"The Label for this profile",
                 :type=>:string,
                 :required=>false},
               :configid=>{:desc=>"", :type=>:numeric, :required=>true},
               :disklist=>
                {:desc=>
                  "A comma delimited list of DiskIDs; position reflects device node.  The 9th element for specifying the initrd.",
                 :type=>:string,
                 :required=>false},
               :runlevel=>
                {:desc=>"One of 'default', 'single', 'binbash' ",
                 :type=>:string,
                 :required=>false},
               :rootdevicero=>
                {:desc=>
                  "Enables the 'ro' kernel flag.  Modern distros want this. ",
                 :type=>:boolean,
                 :required=>false},
               :rootdevicenum=>
                {:desc=>
                  "Which device number (1-8) that contains the root partition.  0 to utilize RootDeviceCustom.",
                 :type=>:numeric,
                 :required=>false},
               :helper_xen=>
                {:desc=>
                  "Enable the Xen filesystem helper.  Corrects fstab and inittab/upstart entries depending on the kernel you're booting.  You want this.",
                 :type=>:boolean,
                 :required=>false},
               :ramlimit=>
                {:desc=>"RAMLimit in MB.  0 for max.",
                 :type=>:numeric,
                 :required=>false},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>false},
               :kernelid=>
                {:desc=>
                  "The KernelID for this profile.  Found in avail.kernels()",
                 :type=>:numeric,
                 :required=>false},
               :helper_depmod=>
                {:desc=>
                  "Creates an empty modprobe file for the kernel you're booting. ",
                 :type=>:boolean,
                 :required=>false}}},
           :create=>
            {:type=>:call,
             :desc=>"Creates a Linode Configuration Profile.",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:rootdevicecustom=>
                {:desc=>"A custom root device setting.",
                 :type=>:string,
                 :required=>false},
               :comments=>
                {:desc=>"Comments you wish to save along with this profile",
                 :type=>:string,
                 :required=>false},
               :devtmpfs_automount=>
                {:desc=>
                  "Controls if pv_ops kernels should automount devtmpfs at boot. ",
                 :type=>:boolean,
                 :required=>false},
               :helper_disableupdatedb=>
                {:desc=>"Enable the disableUpdateDB filesystem helper",
                 :type=>:boolean,
                 :required=>false},
               :label=>
                {:desc=>"The Label for this profile",
                 :type=>:string,
                 :required=>true},
               :disklist=>
                {:desc=>
                  "A comma delimited list of DiskIDs; position reflects device node.  The 9th element for specifying the initrd.",
                 :type=>:string,
                 :required=>false},
               :runlevel=>
                {:desc=>"One of 'default', 'single', 'binbash' ",
                 :type=>:string,
                 :required=>false},
               :rootdevicero=>
                {:desc=>
                  "Enables the 'ro' kernel flag.  Modern distros want this. ",
                 :type=>:boolean,
                 :required=>false},
               :rootdevicenum=>
                {:desc=>
                  "Which device number (1-8) that contains the root partition.  0 to utilize RootDeviceCustom.",
                 :type=>:numeric,
                 :required=>false},
               :helper_xen=>
                {:desc=>
                  "Enable the Xen filesystem helper.  Corrects fstab and inittab/upstart entries depending on the kernel you're booting.  You want this.",
                 :type=>:boolean,
                 :required=>false},
               :ramlimit=>
                {:desc=>"RAMLimit in MB.  0 for max.",
                 :type=>:numeric,
                 :required=>false},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :helper_depmod=>
                {:desc=>
                  "Creates an empty modprobe file for the kernel you're booting. ",
                 :type=>:boolean,
                 :required=>false},
               :kernelid=>
                {:desc=>
                  "The KernelID for this profile.  Found in avail.kernels()",
                 :type=>:numeric,
                 :required=>true}}}}},
       :resize=>
        {:type=>:call,
         :desc=>
          "Resizes a Linode from one plan to another.  Immediately shuts the Linode down, charges/credits the account, and issue a migration to another host server.",
         :throws=>["NOTFOUND", "CCFAILED", "VALIDATION"],
         :params=>
          {:planid=>
            {:desc=>"The desired PlanID available from avail.LinodePlans()",
             :type=>:numeric,
             :required=>true},
           :linodeid=>{:desc=>"", :type=>:numeric, :required=>true}}},
       :job=>
        {:type=>:group,
         :subs=>
          {:list=>
            {:type=>:call,
             :desc=>"",
             :throws=>[],
             :params=>
              {:jobid=>
                {:desc=>"Limits the list to the specified JobID",
                 :type=>:numeric,
                 :required=>false},
               :linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :pendingonly=>
                {:desc=>"", :type=>:boolean, :required=>false}}}}},
       :boot=>
        {:type=>:call,
         :desc=>
          "Issues a boot job for the provided ConfigID.  If no ConfigID is provided boots the last used configuration profile, or the first configuration profile if this Linode has never been booted.",
         :throws=>["NOTFOUND"],
         :params=>
          {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true},
           :configid=>
            {:desc=>
              "The ConfigID to boot, available from linode.config.list().",
             :type=>:numeric,
             :required=>false}}},
       :mutate=>
        {:type=>:call,
         :desc=>"Upgrades a Linode to its next generation.",
         :throws=>["NOTFOUND", "VALIDATION"],
         :params=>{:linodeid=>{:desc=>"", :type=>:numeric, :required=>true}}},
       :shutdown=>
        {:type=>:call,
         :desc=>"Issues a shutdown job for a given LinodeID.",
         :throws=>["NOTFOUND"],
         :params=>
          {:linodeid=>{:desc=>"", :type=>:numeric, :required=>true}}}}},
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
              {:label=>
                {:desc=>"This backend Node's label",
                 :type=>:string,
                 :required=>false},
               :nodeid=>{:desc=>"", :type=>:numeric, :required=>true},
               :mode=>
                {:desc=>
                  "The connections mode for this node.  One of 'accept', 'reject', or 'drain'",
                 :type=>:string,
                 :required=>false},
               :weight=>
                {:desc=>
                  "Load balancing weight, 1-255. Higher means more connections.",
                 :type=>:numeric,
                 :required=>false},
               :address=>
                {:desc=>
                  "The address:port combination used to communicate with this Node",
                 :type=>:string,
                 :required=>false}}},
           :list=>
            {:type=>:call,
             :desc=>
              "Returns a list of Nodes associated with a NodeBalancer Config",
             :throws=>[],
             :params=>
              {:nodeid=>
                {:desc=>"Limits the list to the specified NodeID",
                 :type=>:numeric,
                 :required=>false},
               :configid=>{:desc=>"", :type=>:numeric, :required=>true}}},
           :create=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:label=>
                {:desc=>"This backend Node's label",
                 :type=>:string,
                 :required=>true},
               :mode=>
                {:desc=>
                  "The connections mode for this node.  One of 'accept', 'reject', or 'drain'",
                 :type=>:string,
                 :required=>false},
               :configid=>
                {:desc=>"The parent ConfigID to attach this Node to",
                 :type=>:numeric,
                 :required=>true},
               :weight=>
                {:desc=>
                  "Load balancing weight, 1-255. Higher means more connections.",
                 :type=>:numeric,
                 :required=>false},
               :address=>
                {:desc=>
                  "The address:port combination used to communicate with this Node",
                 :type=>:string,
                 :required=>true}}},
           :delete=>
            {:type=>:call,
             :desc=>"Deletes a Node from a NodeBalancer Config",
             :throws=>["NOTFOUND"],
             :params=>
              {:nodeid=>
                {:desc=>"The NodeID to delete",
                 :type=>:numeric,
                 :required=>true}}}}},
       :create=>
        {:type=>:call,
         :desc=>"",
         :throws=>["NOACCESS", "CCFAILED", "VALIDATION"],
         :params=>
          {:label=>
            {:desc=>"This NodeBalancer's label",
             :type=>:string,
             :required=>false},
           :clientconnthrottle=>
            {:desc=>
              "To help mitigate abuse, throttle connections per second, per client IP. 0 to disable. Max of 20.",
             :type=>:numeric,
             :required=>false},
           :datacenterid=>
            {:desc=>
              "The DatacenterID from avail.datacenters() where you wish to place this new NodeBalancer",
             :type=>:numeric,
             :required=>true},
           :paymentterm=>
            {:desc=>"Subscription term in months.  One of: 0, 1, 12, or 24",
             :type=>:numeric,
             :required=>true}}},
       :delete=>
        {:type=>:call,
         :desc=>
          "Immediately removes a NodeBalancer from your account and issues a pro-rated credit back to your account, if applicable.",
         :throws=>["NOTFOUND"],
         :params=>
          {:nodebalancerid=>
            {:desc=>"The NodeBalancerID to delete",
             :type=>:numeric,
             :required=>true}}},
       :config=>
        {:type=>:group,
         :subs=>
          {:create=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:stickiness=>
                {:desc=>
                  "Session persistence.  One of 'none', 'table', 'http_cookie'",
                 :type=>:string,
                 :required=>false},
               :check_path=>
                {:desc=>"When check=http, the path to request",
                 :type=>:string,
                 :required=>false},
               :check_body=>
                {:desc=>
                  "When check=http_body, a regex against the expected result body",
                 :type=>:string,
                 :required=>false},
               :check_interval=>
                {:desc=>"Seconds between health check probes.  2-3600",
                 :type=>:numeric,
                 :required=>false},
               :algorithm=>
                {:desc=>
                  "Balancing algorithm.  One of 'roundrobin', 'leastconn', 'source'",
                 :type=>:string,
                 :required=>false},
               :nodebalancerid=>
                {:desc=>"The parent NodeBalancer's ID",
                 :type=>:numeric,
                 :required=>true},
               :check_attempts=>
                {:desc=>
                  "Number of failed probes before taking a node out of rotation. 1-30",
                 :type=>:string,
                 :required=>false},
               :port=>
                {:desc=>"Port to bind to on the public interfaces. 1-65534",
                 :type=>:numeric,
                 :required=>false},
               :check=>
                {:desc=>
                  "Perform active health checks on the backend nodes.  One of 'connection', 'http', 'http_body'",
                 :type=>:string,
                 :required=>false},
               :ssl_key=>
                {:desc=>
                  "Unpassphrased private key for the SSL certificate when protocol is 'https'",
                 :type=>:string,
                 :required=>false},
               :protocol=>
                {:desc=>"Either 'tcp', 'http', or 'https'",
                 :type=>:string,
                 :required=>false},
               :check_timeout=>
                {:desc=>
                  "Seconds to wait before considering the probe a failure. 1-30.  Must be less than check_interval.",
                 :type=>:string,
                 :required=>false},
               :ssl_cert=>
                {:desc=>
                  "SSL certificate served by the NodeBalancer when the protocol is 'https'",
                 :type=>:string,
                 :required=>false}}},
           :update=>
            {:type=>:call,
             :desc=>"Updates a Config's properties",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:stickiness=>
                {:desc=>
                  "Session persistence.  One of 'none', 'table', 'http_cookie'",
                 :type=>:string,
                 :required=>false},
               :check_path=>
                {:desc=>"When check=http, the path to request",
                 :type=>:string,
                 :required=>false},
               :check_body=>
                {:desc=>
                  "When check=http_body, a regex against the expected result body",
                 :type=>:string,
                 :required=>false},
               :check_interval=>
                {:desc=>"Seconds between health check probes.  2-3600",
                 :type=>:numeric,
                 :required=>false},
               :algorithm=>
                {:desc=>
                  "Balancing algorithm.  One of 'roundrobin', 'leastconn', 'source'",
                 :type=>:string,
                 :required=>false},
               :configid=>{:desc=>"", :type=>:numeric, :required=>true},
               :check_attempts=>
                {:desc=>
                  "Number of failed probes before taking a node out of rotation. 1-30",
                 :type=>:string,
                 :required=>false},
               :port=>
                {:desc=>"Port to bind to on the public interfaces. 1-65534",
                 :type=>:numeric,
                 :required=>false},
               :check=>
                {:desc=>
                  "Perform active health checks on the backend nodes.  One of 'connection', 'http', 'http_body'",
                 :type=>:string,
                 :required=>false},
               :ssl_key=>
                {:desc=>
                  "Unpassphrased private key for the SSL certificate when protocol is 'https'",
                 :type=>:string,
                 :required=>false},
               :protocol=>
                {:desc=>"Either 'tcp', 'http', or 'https'",
                 :type=>:string,
                 :required=>false},
               :check_timeout=>
                {:desc=>
                  "Seconds to wait before considering the probe a failure. 1-30.  Must be less than check_interval.",
                 :type=>:string,
                 :required=>false},
               :ssl_cert=>
                {:desc=>
                  "SSL certificate served by the NodeBalancer when the protocol is 'https'",
                 :type=>:string,
                 :required=>false}}},
           :delete=>
            {:type=>:call,
             :desc=>"Deletes a NodeBalancer's Config",
             :throws=>["NOTFOUND"],
             :params=>
              {:nodebalancerid=>{:desc=>"", :type=>:numeric, :required=>true},
               :configid=>
                {:desc=>"The ConfigID to delete",
                 :type=>:numeric,
                 :required=>true}}},
           :list=>
            {:type=>:call,
             :desc=>
              "Returns a list of NodeBalancers this user has access or delete to, including their properties",
             :throws=>[],
             :params=>
              {:nodebalancerid=>{:desc=>"", :type=>:numeric, :required=>true},
               :configid=>
                {:desc=>"Limits the list to the specified ConfigID",
                 :type=>:numeric,
                 :required=>false}}}}},
       :update=>
        {:type=>:call,
         :desc=>"Updates a NodeBalancer's properties",
         :throws=>["NOTFOUND", "VALIDATION"],
         :params=>
          {:label=>
            {:desc=>"This NodeBalancer's label",
             :type=>:string,
             :required=>false},
           :clientconnthrottle=>
            {:desc=>
              "To help mitigate abuse, throttle connections per second, per client IP. 0 to disable. Max of 20.",
             :type=>:numeric,
             :required=>false},
           :nodebalancerid=>{:desc=>"", :type=>:numeric, :required=>true}}},
       :list=>
        {:type=>:call,
         :desc=>
          "Returns a list of NodeBalancers this user has access or delete to, including their properties",
         :throws=>[],
         :params=>
          {:nodebalancerid=>
            {:desc=>"Limits the list to the specified NodeBalancerID",
             :type=>:numeric,
             :required=>false}}}}},
   :domain=>
    {:type=>:group,
     :subs=>
      {:update=>
        {:type=>:call,
         :desc=>"Update a domain record.",
         :throws=>["NOTFOUND", "VALIDATION"],
         :params=>
          {:domainid=>{:desc=>"", :type=>:numeric, :required=>true},
           :description=>
            {:desc=>"Currently undisplayed.",
             :type=>:string,
             :required=>false},
           :retry_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :expire_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :status=>
            {:desc=>"0, 1, or 2 (disabled, active, edit mode)",
             :type=>:numeric,
             :required=>false},
           :master_ips=>
            {:desc=>
              "When type=slave, the zone's master DNS servers list, semicolon separated ",
             :type=>:string,
             :required=>false},
           :refresh_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :lpm_displaygroup=>
            {:desc=>
              "Display group in the Domain list inside the Linode DNS Manager",
             :type=>:string,
             :required=>false},
           :soa_email=>
            {:desc=>"Required when type=master",
             :type=>:string,
             :required=>false},
           :ttl_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :domain=>
            {:desc=>"The zone's name", :type=>:string, :required=>false},
           :type=>{:desc=>"master or slave", :type=>:string, :required=>false},
           :axfr_ips=>
            {:desc=>
              "IP addresses allowed to AXFR the entire zone, semicolon separated",
             :type=>:string,
             :required=>false}}},
       :create=>
        {:type=>:call,
         :desc=>"Create a domain record.",
         :throws=>["NOACCESS", "VALIDATION"],
         :params=>
          {:soa_email=>
            {:desc=>"Required when type=master",
             :type=>:string,
             :required=>false},
           :description=>
            {:desc=>"Currently undisplayed.",
             :type=>:string,
             :required=>false},
           :ttl_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :retry_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :expire_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :status=>
            {:desc=>"0, 1, or 2 (disabled, active, edit mode)",
             :type=>:numeric,
             :required=>false},
           :domain=>
            {:desc=>"The zone's name", :type=>:string, :required=>true},
           :master_ips=>
            {:desc=>
              "When type=slave, the zone's master DNS servers list, semicolon separated ",
             :type=>:string,
             :required=>false},
           :refresh_sec=>{:desc=>"", :type=>:numeric, :required=>false},
           :lpm_displaygroup=>
            {:desc=>
              "Display group in the Domain list inside the Linode DNS Manager",
             :type=>:string,
             :required=>false},
           :type=>{:desc=>"master or slave", :type=>:string, :required=>true},
           :axfr_ips=>
            {:desc=>
              "IP addresses allowed to AXFR the entire zone, semicolon separated",
             :type=>:string,
             :required=>false}}},
       :resource=>
        {:type=>:group,
         :subs=>
          {:delete=>
            {:type=>:call,
             :desc=>"",
             :throws=>["NOTFOUND"],
             :params=>
              {:domainid=>{:desc=>"", :type=>:numeric, :required=>true},
               :resourceid=>{:desc=>"", :type=>:numeric, :required=>true}}},
           :list=>
            {:type=>:call,
             :desc=>"",
             :throws=>[],
             :params=>
              {:domainid=>{:desc=>"", :type=>:numeric, :required=>true},
               :resourceid=>{:desc=>"", :type=>:numeric, :required=>false}}},
           :create=>
            {:type=>:call,
             :desc=>"Create a domain record.",
             :throws=>["NOACCESS", "VALIDATION"],
             :params=>
              {:domainid=>{:desc=>"", :type=>:numeric, :required=>true},
               :port=>{:desc=>"", :type=>:numeric, :required=>false},
               :name=>
                {:desc=>
                  "The hostname or FQDN.  When Type=MX the subdomain to delegate to the Target MX server.",
                 :type=>:string,
                 :required=>false},
               :weight=>{:desc=>"", :type=>:numeric, :required=>false},
               :ttl_sec=>
                {:desc=>"TTL.  Leave as 0 to accept our default.",
                 :type=>:numeric,
                 :required=>false},
               :priority=>
                {:desc=>"Priority for MX and SRV records, 0-255",
                 :type=>:numeric,
                 :required=>false},
               :target=>
                {:desc=>
                  "When Type=MX the hostname.  When Type=CNAME the target of the alias.  When Type=TXT the value of the record.  \n\t\tWhen Type=A or AAAA the token of '[remote_addr]' will be substituted with the IP address of the request.",
                 :type=>:string,
                 :required=>false},
               :protocol=>
                {:desc=>
                  "The protocol to append to an SRV record.  Ignored on other record types.",
                 :type=>:string,
                 :required=>false},
               :type=>
                {:desc=>"One of: NS, MX, A, AAAA, CNAME, TXT, or SRV",
                 :type=>:string,
                 :required=>true}}},
           :update=>
            {:type=>:call,
             :desc=>"Update a domain record.",
             :throws=>["NOTFOUND", "VALIDATION"],
             :params=>
              {:domainid=>{:desc=>"", :type=>:numeric, :required=>false},
               :port=>{:desc=>"", :type=>:numeric, :required=>false},
               :resourceid=>{:desc=>"", :type=>:numeric, :required=>true},
               :name=>
                {:desc=>
                  "The hostname or FQDN.  When Type=MX the subdomain to delegate to the Target MX server.",
                 :type=>:string,
                 :required=>false},
               :weight=>{:desc=>"", :type=>:numeric, :required=>false},
               :ttl_sec=>
                {:desc=>"TTL.  Leave as 0 to accept our default.",
                 :type=>:numeric,
                 :required=>false},
               :priority=>
                {:desc=>"Priority for MX and SRV records, 0-255",
                 :type=>:numeric,
                 :required=>false},
               :target=>
                {:desc=>
                  "When Type=MX the hostname.  When Type=CNAME the target of the alias.  When Type=TXT the value of the record.  \n\t\tWhen Type=A or AAAA the token of '[remote_addr]' will be substituted with the IP address of the request.",
                 :type=>:string,
                 :required=>false},
               :protocol=>
                {:desc=>
                  "The protocol to append to an SRV record.  Ignored on other record types.",
                 :type=>:string,
                 :required=>false}}}}},
       :list=>
        {:type=>:call,
         :desc=>"Lists domains you have access to.",
         :throws=>[],
         :params=>
          {:domainid=>
            {:desc=>"Limits the list to the specified DomainID",
             :type=>:numeric,
             :required=>false}}},
       :delete=>
        {:type=>:call,
         :desc=>"",
         :throws=>["NOTFOUND"],
         :params=>
          {:domainid=>{:desc=>"", :type=>:numeric, :required=>true}}}}},
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
          {:planid=>
            {:desc=>"Limits the list to the specified PlanID",
             :type=>:numeric,
             :required=>false}}},
       :stackscripts=>
        {:type=>:call,
         :desc=>"Returns a list of available public StackScripts.",
         :throws=>[],
         :params=>
          {:distributionid=>
            {:desc=>
              "Limit the results to StackScripts that can be applied to this DistributionID",
             :type=>:numeric,
             :required=>false},
           :keywords=>
            {:desc=>"Search terms", :type=>:string, :required=>false},
           :distributionvendor=>
            {:desc=>"Debian, Ubuntu, Fedora, etc.",
             :type=>:string,
             :required=>false}}},
       :distributions=>
        {:type=>:call,
         :desc=>"Returns a list of available Linux Distributions.",
         :throws=>[],
         :params=>
          {:distributionid=>
            {:desc=>"Limits the results to the specified DistributionID",
             :type=>:numeric,
             :required=>false}}},
       :kernels=>
        {:type=>:call,
         :desc=>"List available kernels.",
         :throws=>[],
         :params=>
          {:isxen=>
            {:desc=>"Limits the results to show only Xen kernels",
             :type=>:boolean,
             :required=>false},
           :kernelid=>{:desc=>"", :type=>:numeric, :required=>false}}}}},
   :account=>
    {:type=>:group,
     :subs=>
      {:estimateinvoice=>
        {:type=>:call,
         :desc=>
          "Estimates the invoice for adding a new Linode or NodeBalancer as well as resizing a Linode. This returns two fields: PRICE which is the estimated cost of the invoice, and INVOICE_TO which is the date invoice would be though with timezone set to America/New_York",
         :throws=>["VALIDATION"],
         :params=>
          {:paymentterm=>
            {:desc=>
              "Subscription term in months. One of: 1, 12, or 24. This is required for modes 'linode_new' and 'nodebalancer_new'.",
             :type=>:numeric,
             :required=>false},
           :mode=>
            {:desc=>
              "This is one of the following options: 'linode_new', 'linode_resize', or 'nodebalancer_new'.",
             :type=>:string,
             :required=>true},
           :planid=>
            {:desc=>
              "The desired PlanID available from avail.LinodePlans(). This is required for modes 'linode_new' and 'linode_resize'.",
             :type=>:numeric,
             :required=>false},
           :linodeid=>
            {:desc=>
              "This is the LinodeID you want to resize and is required for mode 'linode_resize'.",
             :type=>:numeric,
             :required=>false}}},
       :updatecard=>
        {:type=>:call,
         :desc=>"",
         :throws=>[],
         :params=>
          {:ccexpmonth=>{:desc=>"", :type=>:numeric, :required=>true},
           :ccexpyear=>{:desc=>"", :type=>:numeric, :required=>true},
           :ccnumber=>{:desc=>"", :type=>:numeric, :required=>true}}},
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
          ["CCEXPIRED",
           "CCFAILED",
           "NOACCESS",
           "PAYMENTLIMITER",
           "VALIDATION"],
         :params=>{}}}},
   :stackscript=>
    {:type=>:group,
     :subs=>
      {:create=>
        {:type=>:call,
         :desc=>"Create a StackScript.",
         :throws=>["NOACCESS", "VALIDATION"],
         :params=>
          {:label=>
            {:desc=>"The Label for this StackScript",
             :type=>:string,
             :required=>true},
           :rev_note=>{:desc=>"", :type=>:string, :required=>false},
           :script=>
            {:desc=>"The actual script", :type=>:string, :required=>true},
           :ispublic=>
            {:desc=>
              "Whether this StackScript is published in the Library, for everyone to use",
             :type=>:boolean,
             :required=>false},
           :distributionidlist=>
            {:desc=>
              "Comma delimited list of DistributionIDs that this script works on ",
             :type=>:string,
             :required=>true},
           :description=>{:desc=>"", :type=>:string, :required=>false}}},
       :delete=>
        {:type=>:call,
         :desc=>"",
         :throws=>["NOTFOUND"],
         :params=>
          {:stackscriptid=>{:desc=>"", :type=>:numeric, :required=>true}}},
       :update=>
        {:type=>:call,
         :desc=>"Update a StackScript.",
         :throws=>["NOTFOUND", "VALIDATION"],
         :params=>
          {:rev_note=>{:desc=>"", :type=>:string, :required=>false},
           :script=>
            {:desc=>"The actual script", :type=>:string, :required=>false},
           :description=>{:desc=>"", :type=>:string, :required=>false},
           :distributionidlist=>
            {:desc=>
              "Comma delimited list of DistributionIDs that this script works on ",
             :type=>:string,
             :required=>false},
           :label=>
            {:desc=>"The Label for this StackScript",
             :type=>:string,
             :required=>false},
           :ispublic=>
            {:desc=>
              "Whether this StackScript is published in the Library, for everyone to use",
             :type=>:boolean,
             :required=>false},
           :stackscriptid=>{:desc=>"", :type=>:numeric, :required=>true}}},
       :list=>
        {:type=>:call,
         :desc=>"Lists StackScripts you have access to.",
         :throws=>[],
         :params=>
          {:stackscriptid=>
            {:desc=>"Limits the list to the specified StackScriptID",
             :type=>:numeric,
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
          {:password=>{:desc=>"", :type=>:string, :required=>true},
           :username=>{:desc=>"", :type=>:string, :required=>true}}}}},
   :test=>
    {:type=>:group,
     :subs=>
      {:echo=>
        {:type=>:call,
         :desc=>"Echos back parameters that were passed in.",
         :throws=>[],
         :params=>{}}}}}}

end
