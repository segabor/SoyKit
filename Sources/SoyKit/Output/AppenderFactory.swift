//
//  AppenderFactory.swift
//  
//
//  AppenderFactory by Sebestyén Gábor on 2020. 09. 26..
//

public class AppenderFactory {

    public static func makeAppender(for type: ContentKind) throws -> Appender {
        switch type {
        case .HTML, .TEXT:
            return try StringBuffer(with: type)
        default:
            throw AppenderError.UNSUPPORTED_CONTENT_TYPE
        }
    }
}
