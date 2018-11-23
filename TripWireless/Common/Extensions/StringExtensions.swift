//
//  StringExtensions.swift
//  FirePoint

import UIKit

extension String {
    
    
    internal func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        
        return String(self[substringStartIndex ..< substringEndIndex])
    }
    
    
    
    var removeSpecialCharsFromNumber: String? {
        let okayChars = Set("0123456789")
        return self.filter {okayChars.contains($0) }
    }
    
    var firstLetterUppercased: String {
        guard let firstLetter = first else { return "" }
        return String(firstLetter).uppercased() + dropFirst()
    }
    
    func toKeyValuePairs() -> [String: Any] {
        
        let params = self.components(separatedBy: "&").map({
            $0.components(separatedBy: "=")
        }).reduce(into: [String: Any]()) { dict, pair in
            if pair.count == 2 {
                dict[pair[0]] = pair[1]
            }
        }
        
        return params
    }

    
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    public func toPhoneNumberFormat(_ format: String = "$1-$2-$3") -> String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: format, options: .regularExpression, range: nil)
    }
    public func toPhoneNumberFormatWithBraces(_ format: String = "($1) $2-$3") -> String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: format, options: .regularExpression, range: nil)
    }
    
    
}


extension String {
    
    func containsHTTPScheme() -> Bool {
        
        if(self.hasPrefix("http") || self.hasPrefix("https")){
            return true
        }
        return false
    }
    
    func isValidEmail() -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidMobileNumber() -> Bool {
        
        return self.count == 10
    }
}

// MARK: HTML
extension String {
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}



// MARK: - NSRegularExpression
extension String {
    
    func matchesPattern(_ pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
            let range: NSRange = NSMakeRange(0, self.count)
            let matches = regex.matches(in: self, options: NSRegularExpression.MatchingOptions(), range: range)
            return matches.count > 0
        } catch _ {
            return false
        }
    }
    
    func getFirstMatch(_ pattern: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
            let range: NSRange = NSMakeRange(0, self.count)
            let matches = regex.matches(in: self, options: NSRegularExpression.MatchingOptions(), range: range)
            
            if let firstMatch = matches.first {
                return String(self[Range(firstMatch.range, in: self)!])
            } else {
                return nil
            }
        } catch _ {
            return nil
        }
    }
    
}



