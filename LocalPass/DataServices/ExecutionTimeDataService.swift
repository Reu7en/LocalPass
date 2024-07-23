//
//  ExecutionTimeDataService.swift
//  LocalPass
//
//  Created by Reuben on 23/07/2024.
//

import Foundation

struct ExecutionTimeDataService {
    static func measureMachAbsoluteTime(block: () -> Void) -> UInt64 {
        var timebase = mach_timebase_info_data_t()
        
        mach_timebase_info(&timebase)
        
        let start = mach_absolute_time()
        
        block()
        
        let end = mach_absolute_time()
        let elapsed = end - start
        let nanos = elapsed * UInt64(timebase.numer) / UInt64(timebase.denom)
        
        return nanos
    }
}
