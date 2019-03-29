

public enum Lists {
    // Returns the length of a list
    // length(list)
    public static func length(_ value: SoyValue) throws -> SoyValue {
        guard case let .array(list) = value else {
            throw RuntimeError.invalidInput
        }

        return .integer(list.count)
    }

    // Joins two or more lists together
    // concatLists(list, list...)
    public static func concatLists(_ values: SoyValue ...) throws -> SoyValue {
        var result = Array<SoyValue>()

        for value in values {
            if case let .array(list) = value {
                result += list
            } else {
                throw RuntimeError.invalidInput
            }
        }

        return .array(result)
    }

    // Checks if the given value is inside the list.
    // listContains(list, value)
    public static func listContains(_ valueList: SoyValue, _ value: SoyValue) throws -> SoyValue {
        guard case let .array(list) = valueList else {
            throw RuntimeError.invalidInput
        }

        return .bool(list.contains(value))
    }

    // Joins the list of strings with a string separator.
    // join(list, separator)
    public static func join(_ valueList: SoyValue, _ separator: SoyValue) throws -> SoyValue {
        guard case let .array(list) = valueList else {
            throw RuntimeError.invalidInput
        }
        let sep: String = separator.coerceToString

        return .string(list.map{ $0.coerceToString }.joined(separator: sep))
    }

    // Use this to create lists containing arithmetic progressions.
    // It is most often used in indexed for loops.
    // If the step argument is omitted, it defaults to 1.
    // If the start argument is omitted, it defaults to 0.
    // The full form returns a list of plain integers
    // [start, start + step, start + 2 * step, ...].
    //
    // range([start,] end[, step])
    public static func range(_ start: SoyValue, _ end: SoyValue, _ step: SoyValue) throws -> SoyValue {
        guard var index = start.coerceToNumber?.doubleValue else {
            throw RuntimeError.invalidInput
        }
        guard let end = end.coerceToNumber?.doubleValue else {
            throw RuntimeError.invalidInput
        }
        guard let step = step.coerceToNumber?.doubleValue, step > 0 else {
            throw RuntimeError.invalidInput
        }

        var range: [SoyValue] = []
        while index < end {
            range.append(.double(index))
            index += step
        }

        return .array(range)
    }

}
