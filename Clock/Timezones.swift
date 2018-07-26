//
//  Timezones.swift
//  Clock
//
//  Created by Kristina Neuwirth on 7/25/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import Foundation

struct TimeZones {
    static var timeZonesArray = [
        "America/New_York",
        "America/Halifax",
        "America/Juneau",
        "America/Argentina/Buenos_Aires",
        "Asia/Dhaka",
        "America/Sao_Paulo",
        "Europe/London",
        "Africa/Harare",
        "America/Chicago",
        "Europe/Paris",
        "America/Santiago",
        "America/Bogota",
        "Africa/Addis_Ababa",
        "Europe/Istanbul",
        "Asia/Dubai",
        "Asia/Hong_Kong",
        "Pacific/Honolulu",
        "Asia/Bangkok",
        "Asia/Tehran",
        "Asia/Calcutta",
        "Asia/Tokyo",
        "Asia/Seoul",
        "America/Denver",
        "Europe/Moscow",
        "America/Denver",
        "Pacific/Auckland",
        "America/Los_Angeles",
        "America/Lima",
        "Asia/Manila",
        "Asia/Karachi",
        "Asia/Singapore",
        "Africa/Lagos",
        "Europe/Lisbon",
        "Asia/Jakarta"
    ]
    
    static var storageKey = "timeZone" //all 'keys' or otherwise should always be made into a static var - don't leave them as string literals to be typed out - it's just begging for typos / bugs
    
}
