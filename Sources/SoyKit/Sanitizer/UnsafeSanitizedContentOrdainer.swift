//
//  SoyValue+ordainAsSafe.swift
//  SoyKit
//
//  Created by Gábor Sebestyén on 2019. 12. 29..
//

/**
 * <p>Creating a SanitizedContent object is potentially dangerous, as it means you're swearing in
 * advance the content won't cause a cross site scripting vulnerability. In the long term it is
 * nearly impossible to show that any piece of code will always produce safe content -- for example,
 * a parameter that is safe one day may be vulnerable after a refactoring that uses it in a
 * different way.
 *
 * <p>We suggest you limit your usage of this to just a few files in your code base. Create a small
 * set of utility files that generate and sanitize at the same time. Example utilities:
 *
 * <ul>
 *   <li>Serializing JSON objects from a data structure.
 *   <li>Running a sanitizer on HTML for an email message.
 *   <li>Extracting a field from a protocol message that is always run-time sanitized by a backend.
 *       It's useful to label the protocol message fields with a "SafeHtml" suffix to reinforce.
 * </ul>
 *
 */
public struct UnsafeSanitizedContentOrdainer {
    /**
     * ORIGINAL COMMENT OF UnsafeSanitizedContentOrdainer.ordainAsSafe(String, ContentKind)
     *
     * Faithfully assumes the provided value is "safe" and marks it not to be re-escaped. The value's
     * direction is assumed to be LTR for JS, URI, ATTRIBUTES, and CSS content, and otherwise unknown.
     *
     * <p>When you "ordain" a string as safe content, it means that Soy will NOT re-escape or validate
     * the contents if printed in the relevant context. You can use this to insert known-safe HTML
     * into a template via a parameter.
     *
     * <p>This doesn't do a lot of strict checking, but makes it easier to differentiate safe
     * constants in your code.
     */
    public static func ordainAsSafe(value: SoyValue ,kind: ContentKind) -> SoyValue {
        switch value {
        case .sanitized:
            return value
        default:
            let unsafeContent = value.coerceToString
            return .sanitized(kind, unsafeContent)
        }
    }
}
