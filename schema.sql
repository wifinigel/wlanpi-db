-- Database structure for WLAN Pi Core Functions:

-- Enable foreign key support in Sqlite
PRAGMA foreign_keys=ON;

-- #####################################################################
--  Results of last query or last test for a variety of WLAN Pi utils
--  and configuration parameters. All data is for a single instance
--  of a data item (i.e. no time series data)
-- #####################################################################

-- WLAN Pi global data

CREATE TABLE Global (
    image_version VARCHAR(30), -- WLAN Pi image version
    image_version_ts INTEGER, -- image version timestamp
    timezone VARCHAR(3),
    timezone_ts INTEGER -- timezone timestamp
    wpa_pass VARCHAR(64), -- WPA passphrase
    wpa_pass_ts INTEGER -- passphrase timestamp
);

-- WLAN Pi Interfaces (ifconfig info)

CREATE TABLE Interfaces (
    interface_id INTEGER PRIMARY KEY,
    interface_name VARCHAR(30) NOT NULL,
    interface_admin_status INTEGER,
    interface_op_status INTEGER,
    ipv4_address VARCHAR(15) NOT NULL,
    ipv4_mask VARCHAR(15) NOT NULL,
    ipv4_gateway VARCHAR(15) NOT NULL,
    hw_addr VARCHAR(20),
    timezone VARCHAR(3),
    data_timestamp INTEGER, -- Unix timestamp of data
);

-- WLAN Pi WLAN interfaces (iwconfig info)

CREATE TABLE WlanInterfaces (
    interface_id INTEGER PRIMARY KEY,
    interface_name VARCHAR(30) NOT NULL,
    interface_id INTEGER NOT NULL,
    interface_admin_status INTEGER,
    interface_op_status INTEGER,
    ipv4_address VARCHAR(15) NOT NULL,
    ipv4_mask VARCHAR(15) NOT NULL,
    ipv4_gateway VARCHAR(15) NOT NULL,
    hw_addr VARCHAR(20),
    timezone VARCHAR(3),
    data_timestamp INTEGER -- Unix timestamp of data
);

-- Eth0 interface info

CREATE TABLE Eth0Interface (
    ipv4_address VARCHAR(15) NOT NULL,
    ipv4_mask VARCHAR(5) NOT NULL,
    ipv4_gateway VARCHAR(15) NOT NULL,
    ipv4_dns VARCHAR(15) NOT NULL,
    dhcp_server VARCHAR(15),
    interface_speed VARCHAR(10),
    interface_duplex VARCHAR(10),
    data_timestamp INTEGER -- Unix timestamp of data
);

-- Eth0 VLAN Info

CREATE TABLE Eth0Vlan (
    native_vlan VARCHAR(5) NOT NULL,
    data_timestamp INTEGER -- Unix timestamp of data
);

-- LLDP info

CREATE TABLE LldpInfo (
    neighbor_name VARCHAR(60) NOT NULL,
    neighbor_port VARCHAR(10) NOT NULL,
    neighbor_port_descr VARCHAR(30) NOT NULL,
    neighbor_ip VARCHAR(15) NOT NULL,
    native_vlan VARCHAR(5) NOT NULL,
    neighbor_model VARCHAR(200) NOT NULL,
    data_timestamp INTEGER -- Unix timestamp of data
);

-- CDP info

CREATE TABLE CdpInfo (
    neighbor_name VARCHAR(60) NOT NULL,
    neighbor_port VARCHAR(30) NOT NULL,
    neighbor_ip VARCHAR(15) NOT NULL,
    native_vlan VARCHAR(5) NOT NULL,
    neighbor_model VARCHAR(200) NOT NULL,
    data_timestamp INTEGER -- Unix timestamp of data
);

-- Public IP info

CREATE TABLE PublicIp (
    ip VARCHAR(60) NOT NULL,
    country VARCHAR(30) NOT NULL,
    asn VARCHAR(10) NOT NULL,
    asn_org VARCHAR(60) NOT NULL,
    hostname VARCHAR(60 NOT NULL,
    data_timestamp INTEGER -- Unix timestamp of data
);

-- USB devices found on WLAN Pi

CREATE TABLE Usb_Devices (
    interface_id INTEGER PRIMARY KEY,
    interface_name VARCHAR(30) NOT NULL,
    data_timestamp INTEGER -- Unix timestamp of data
);

-- UFW ports info

CREATE TABLE UfwStatus (
    ufw_status INTEGER NOT NULL, -- boolean 1 or 0
    data_timestamp INTEGER NOT NULL, -- Unix timestamp of data
);

CREATE TABLE UfwRules (
    rule_id INTEGER PRIMARY KEY,
    rule_string VARCHAR(60) NOT NULL,
    data_timestamp INTEGER NOT NULL, -- Unix timestamp of data
);

-- System summary data

CREATE TABLE SystemSummary (
    ipv4_address VARCHAR(15) NOT NULL,
    cpu_load VARCHAR(5) NOT NULL,
    memory_util VARCHAR(18) NOT NULL,
    disk_util VARCHAR(12) NOT NULL,
    cpu_temp VARCHAR(8) NOT NULL,
    data_timestamp INTEGER NOT NULL, -- Unix timestamp of data
);

-- Mist Cloud connectivity test

CREATE TABLE MistCloud (
    eth_port INTEGER NOT NULL, -- boolean 1 or 0
    ipv4_address VARCHAR(15) NOT NULL,
    dns_status  INTEGER NOT NULL, -- boolean 1 or 0
    http_status  INTEGER NOT NULL, -- boolean 1 or 0
    data_timestamp INTEGER NOT NULL, -- Unix timestamp of data
);

-- ################################
--  Time series results data
-- ################################

-- Results of speedtest

CREATE TABLE SpeedtestResult (
    result_id INTEGER PRIMARY KEY,
    my_ip VARCHAR(40) NOT NULL, -- public IP used to perform speedtest
    download_rate_mbps VARCHAR(10) NOT NULL,
    upload_rate_mbps VARCHAR(10) NOT NULL,
    data_timestamp INTEGER NOT NULL, -- Unix timestamp of data
);

-- Results of reachability tests

CREATE TABLE Reachability (
    result_id INTEGER PRIMARY KEY,
    ping_google VARCHAR(10) NOT NULL,
    browse_google INTEGER NOT NULL, -- boolean 1 or 0
    ping_gateway VARCHAR(10) NOT NULL,
    primary_dns INTEGER NOT NULL, -- boolean 1 or 0
    pri_dns  INTEGER NOT NULL, -- boolean 1 or 0
    arping VARCHAR(10) NOT NULL,
    data_timestamp INTEGER, -- Unix timestamp of data
);

-- Profiler unique MACs

CREATE TABLE ProfilerMacs (
    mac_id INTEGER PRIMARY KEY,
    mac VARCHAR(30) NOT NULL,
);

CREATE TABLE ProfilerResults (
    result_id INTEGER PRIMARY KEY,
    oui VARCHAR(30) NOT NULL,
    capture_channel INTEGER (3) NOT NULL,
    11k INTEGER NOT NULL, -- boolean 1 or 0
    11k INTEGER NOT NULL, -- boolean 1 or 0
    11k INTEGER NOT NULL, -- boolean 1 or 0
    11k INTEGER NOT NULL, -- boolean 1 or 0
    11n INTEGER NOT NULL, -- boolean 1 or 0
    11n_ss INTEGER NOT NULL,
    11ac INTEGER NOT NULL, -- boolean 1 or 0
    11ac_ss INTEGER NOT NULL,
    11ac_su_bf INTEGER NOT NULL, -- boolean 1 or 0
    11ac_mu_bf INTEGER NOT NULL, -- boolean 1 or 0
    11ax INTEGER NOT NULL, -- boolean 1 or 0
    max_power VARCHAR(8),
    min_power VARCHAR(8),
    supported_channels VARCHAR(90)
    data_timestamp INTEGER, -- Unix timestamp of data

    mac_id INTEGER NOT NULL,
    FOREIGN KEY(mac_id) REFERENCES ProfilerMacs(mac_id),
);

