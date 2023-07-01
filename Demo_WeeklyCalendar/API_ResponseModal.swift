//
//  API_ResponseModal.swift
//  Demo_WeeklyCalendar
//
//  Created by Nayan Dave on 28/06/23.
//

import Foundation

// MARK: - All_Event_Response_Modal
struct All_Event_Response_Modal: Codable {
    var statusCode: Int?
    var status, message: String?
    var data: All_Event_List_Container?

    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case status = "Status"
        case message = "Message"
        case data = "Data"
    }
}

// MARK: - All_Event_List_Container
struct All_Event_List_Container: Codable {
    var list: [Event_Data]?
}

// MARK: - Event_Data
struct Event_Data: Codable {
    var dlEventID: Int?
    var eventSubject: String?
    var eventDesc: String?
    var enentNote: String?
    var meetingType: String?
    var eventType: Int?
    var eventFromDate, eventToDate: String?
    var eventFromTime, eventToTime, keyword, eventReminderInfo: String?
    var eventLabel: String?
    var eventAllDays: Bool?
    var eventStatusID: Int?
    var googleMapLink, recurrence, email: String?
    var isMeetingExpNoti: Bool?
    var postEventCreationMinutes, personList, assetsList, documentList: String?
    var eventIsActive, eventIsDeleted: Bool?
    var internalPersonID, internalPersonName: String?
    var eventEntDt: String?
    var eventEntTerm: String?
    var eventUpdTerm, eventUpdDt: String?
    var freqInterval, refDLEvent, personID, rfidCardNumber: String?
    var ssid, ssidName: String?
    var meetingTypeID: Int?
    var meetingTypeName: String?
    var isMomRequired: Bool?
    var dlEventRecurrenceID, eventIsRecurrence: String?
    var eventIsBroadcast: Bool?
    var onResourceBeforeMinutes, locationID, eventLocationID: Int?
    var eventLocation: String?
    var eventMainStatusID: Int?
    var duration: String?
    var createdByUserID: Int?
    var createdByUserName: CreatedForUserName?
    var createdForUserID: Int?
    var createdForUserName: String?
    var doorSourceID: String?
    var statusDesc: String?
    var evtdirectDID, doorName, doorDestinationID: String?
    var dlCategoryID: Int?
    var locationName: String?
    var timeZone: String?
    var createdforEmpid: Int?
    var secondsFromGMT: String?
    var isExternalInvitee: Bool?
    var localSyncEventID: Int?
    var eventOwnerInTime, recurrenceTypeID, recurrenceWeekDay: String?
    var deviceDetail: String?
    var dlEventTaskLink: [String]?
    var dlEventParticipents: [DLEventParticipent]?
    var vmsNewVisitorList: String?
    var dlEventResources, dlEventDocumentDets: [String]?
    var dlEventMatrixDoorDet: [DLEventMatrixDoorDet]?
    var airisReminderDet: [AirisReminderDet]?
    var dlEventFollowersDet, tagRelationMst: [String]?

    enum CodingKeys: String, CodingKey {
        case dlEventID = "DLEventID"
        case eventSubject = "EventSubject"
        case eventDesc = "EventDesc"
        case enentNote = "EnentNote"
        case meetingType = "MeetingType"
        case eventType = "EventType"
        case eventFromDate = "EventFromDate"
        case eventToDate = "EventToDate"
        case eventFromTime = "EventFromTime"
        case eventToTime = "EventToTime"
        case keyword = "Keyword"
        case eventReminderInfo = "EventReminderInfo"
        case eventLabel = "EventLabel"
        case eventAllDays = "EventAllDays"
        case eventStatusID = "EventStatusID"
        case googleMapLink = "GoogleMapLink"
        case recurrence = "Recurrence"
        case email = "Email"
        case isMeetingExpNoti = "IsMeetingExpNoti"
        case postEventCreationMinutes = "PostEventCreationMinutes"
        case personList = "PersonList"
        case assetsList = "AssetsList"
        case documentList = "DocumentList"
        case eventIsActive = "EventIsActive"
        case eventIsDeleted = "EventIsDeleted"
        case internalPersonID = "InternalPersonID"
        case internalPersonName = "InternalPersonName"
        case eventEntDt = "EventEntDt"
        case eventEntTerm = "EventEntTerm"
        case eventUpdTerm = "EventUpdTerm"
        case eventUpdDt = "EventUpdDt"
        case freqInterval = "FreqInterval"
        case refDLEvent = "RefDLEvent"
        case personID = "PersonID"
        case rfidCardNumber = "RFIDCardNumber"
        case ssid = "SSID"
        case ssidName = "SSIDName"
        case meetingTypeID = "MeetingTypeID"
        case meetingTypeName = "MeetingTypeName"
        case isMomRequired = "IsMomRequired"
        case dlEventRecurrenceID = "DLEventRecurrenceID"
        case eventIsRecurrence = "EventIsRecurrence"
        case eventIsBroadcast = "EventIsBroadcast"
        case onResourceBeforeMinutes = "OnResourceBeforeMinutes"
        case locationID = "LocationID"
        case eventLocationID = "EventLocationID"
        case eventLocation = "EventLocation"
        case eventMainStatusID = "EventMainStatusID"
        case duration = "Duration"
        case createdByUserID = "CreatedByUserID"
        case createdByUserName = "CreatedByUserName"
        case createdForUserID = "CreatedForUserID"
        case createdForUserName = "CreatedForUserName"
        case doorSourceID = "DoorSourceID"
        case statusDesc = "StatusDesc"
        case evtdirectDID = "EvtdirectDID"
        case doorName = "DoorName"
        case doorDestinationID = "DoorDestinationID"
        case dlCategoryID = "DLCategoryID"
        case locationName = "LocationName"
        case timeZone = "TimeZone"
        case createdforEmpid = "CreatedforEmpid"
        case secondsFromGMT = "SecondsFromGMT"
        case isExternalInvitee = "IsExternalInvitee"
        case localSyncEventID = "LocalSyncEventID"
        case eventOwnerInTime = "EventOwnerInTime"
        case recurrenceTypeID = "RecurrenceTypeID"
        case recurrenceWeekDay = "RecurrenceWeekDay"
        case deviceDetail = "DeviceDetail"
        case dlEventTaskLink = "DLEventTaskLink"
        case dlEventParticipents = "DLEventParticipents"
        case vmsNewVisitorList = "VMSNewVisitorList"
        case dlEventResources = "DLEventResources"
        case dlEventDocumentDets = "DLEventDocumentDets"
        case dlEventMatrixDoorDet = "DLEventMatrixDoorDet"
        case airisReminderDet = "AirisReminderDet"
        case dlEventFollowersDet = "DLEventFollowersDet"
        case tagRelationMst = "TagRelationMst"
    }
}

// MARK: - AirisReminderDet
struct AirisReminderDet: Codable {
    var reminderID: Int?
    var identifier: String?
    var dlEventID: Int?
    var dlTaskID: String?
    var userID, typeRaw, typeValue: Int?
    var entDt: String?
    var entUser: String?
    var entTerm: String?
    var updDt: String?
    var updUser: String?
    var updTerm: String?
    var isActive, isForStartDate: Bool?

    enum CodingKeys: String, CodingKey {
        case reminderID = "ReminderID"
        case identifier = "Identifier"
        case dlEventID = "DLEventID"
        case dlTaskID = "DLTaskID"
        case userID = "UserID"
        case typeRaw = "TypeRaw"
        case typeValue = "TypeValue"
        case entDt = "EntDt"
        case entUser = "EntUser"
        case entTerm = "EntTerm"
        case updDt = "UpdDt"
        case updUser = "UpdUser"
        case updTerm = "UpdTerm"
        case isActive = "IsActive"
        case isForStartDate = "IsForStartDate"
    }
}

enum Term: String, Codable {
    case the172271230 = "172.27.1.230"
}

enum CreatedForUserName: String, Codable {
    case dipakRathod = "Dipak Rathod"
    case faizNagariya = "Faiz Nagariya"
    case jitendraNikam = "Jitendra Nikam"
    case nareshNagar = "Naresh Nagar"
    case rohanDesai = "Rohan Desai"
    case somprabhaDandpat = "Somprabha Dandpat"
}

// MARK: - DLEventMatrixDoorDet
struct DLEventMatrixDoorDet: Codable {
    var evtdirectDID, dlEventID: Int?
    var doorID, doorName, entdt: String?
    var doorGroupID, doorType: String?
    var entUser: String?
    var entTerm: String?
    var doorLink: Bool?

    enum CodingKeys: String, CodingKey {
        case evtdirectDID = "EvtdirectDID"
        case dlEventID = "DLEventID"
        case doorID = "DoorID"
        case doorName = "DoorName"
        case entdt = "Entdt"
        case doorGroupID = "DoorGroupID"
        case doorType = "DoorType"
        case entUser = "EntUser"
        case entTerm = "EntTerm"
        case doorLink = "DoorLink"
    }
}

// MARK: - DLEventParticipent
struct DLEventParticipent: Codable {
    var participentLogID: Int?
    var isAttending: String?
    var confirmationString: String?
    var visitorTrackID: String?
    var actualCheckInTime, actualCheckOutTime: String?
    var isBlockedInMatrix, isNotifiedForBlock, notesForParticipent: String?
    var rfidCardNumber: String?
    var tokenNumber: String?
    var showAs: Int?
    var participentAssets: String?
    var isCoHost, sendEmail, isPersonActive: Bool?
    var notificationID: String?
    var isMeetingExpNoti: Bool?
    var dlEventID, personID: Int?
    var personName, personDepartment: String?
    var personDesignation: String?
    var personCompany: String?
    var personPhotoName: String?
    var meetingRoomAddMe: String?
    var dlEventParticipentAsset: [DLEventParticipentAsset]?
    var participentPunchDetail: String?

    enum CodingKeys: String, CodingKey {
        case participentLogID = "ParticipentLogID"
        case isAttending = "IsAttending"
        case confirmationString = "ConfirmationString"
        case visitorTrackID = "VisitorTrackID"
        case actualCheckInTime = "ActualCheckInTime"
        case actualCheckOutTime = "ActualCheckOutTime"
        case isBlockedInMatrix = "IsBlockedInMatrix"
        case isNotifiedForBlock = "IsNotifiedForBlock"
        case notesForParticipent = "NotesForParticipent"
        case rfidCardNumber = "RFIDCardNumber"
        case tokenNumber = "TokenNumber"
        case showAs = "ShowAs"
        case participentAssets = "ParticipentAssets"
        case isCoHost = "IsCoHost"
        case sendEmail = "SendEmail"
        case isPersonActive = "IsPersonActive"
        case notificationID = "NotificationID"
        case isMeetingExpNoti = "IsMeetingExpNoti"
        case dlEventID = "DLEventID"
        case personID = "PersonID"
        case personName = "PersonName"
        case personDepartment = "PersonDepartment"
        case personDesignation = "PersonDesignation"
        case personCompany = "PersonCompany"
        case personPhotoName = "PersonPhotoName"
        case meetingRoomAddMe = "MeetingRoomAddMe"
        case dlEventParticipentAsset = "DLEventParticipentAsset"
        case participentPunchDetail = "ParticipentPunchDetail"
    }
}

// MARK: - DLEventParticipentAsset
struct DLEventParticipentAsset: Codable {
    var dlEventParticipentAssetID: Int?
    var remark: String?
    var dlParticipentLogID, dlAssetsID: Int?
    var assetsName, dlEventAssetEntDt, dlEventAssetUpdDt: String?

    enum CodingKeys: String, CodingKey {
        case dlEventParticipentAssetID = "DLEventParticipentAssetID"
        case remark = "Remark"
        case dlParticipentLogID = "DLParticipentLogID"
        case dlAssetsID = "DLAssetsID"
        case assetsName = "AssetsName"
        case dlEventAssetEntDt = "DLEventAssetEntDt"
        case dlEventAssetUpdDt = "DLEventAssetUpdDt"
    }
}
