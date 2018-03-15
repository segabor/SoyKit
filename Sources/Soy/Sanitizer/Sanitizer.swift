//
//  Sanitizer.swift
//  Soy
//
//  Created by Gábor Sebestyén on 2018. 03. 15..
//

public let SAFE_TAG_WHITELIST = ["b", "br", "em", "i", "s", "sub", "sup", "u"]


// TODO: Implement this https://github.com/google/closure-templates/blob/a59f1bb9ddffaa11264371a8cf0b75f3b50429e1/java/src/com/google/template/soy/shared/internal/Sanitizers.java
public func cleanHtml(_ value: Sanitizable, _ safeTags: [String] = SAFE_TAG_WHITELIST) -> SanitizedContent {
    if let safeContent = value as? SanitizedContent {
        return safeContent
    }

    // TODO: implement
    
    return SanitizedContent(safeContent: value.content)
}

// Copied from /soy/java/src/com/google/template/soy/data/UnsafeSanitizedContentOrdainer.java
/**
 *
 *
 * Restricted class to create SanitizedContent objects.
 *
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
public func ordainAsSafe(_ value: Sanitizable, _ kind: ContentKind) -> SanitizedContent {
    if let safeContent = value as? SanitizedContent {
        return safeContent
    }

    // TODO: shall content kind be passed?
    return SanitizedContent(safeContent: value.content)
}
