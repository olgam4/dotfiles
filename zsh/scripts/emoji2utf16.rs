use std::env;

fn main() {
    // Collect command-line arguments
    let args: Vec<String> = env::args().collect();

    let mut zmk_mode = false;
    let mut emoji_str: Option<String> = None;

    // Parse arguments
    for i in 1..args.len() {
        if args[i] == "-zmk" {
            zmk_mode = true;
        } else {
            // Assume the first non-flag argument is the emoji string
            if emoji_str.is_none() {
                emoji_str = Some(args[i].clone());
            } else {
                // If multiple non-flag arguments, treat them as part of the emoji string
                // This handles cases like "👋 🚀" being passed as two separate arguments
                // by joining them with a space.
                // For a single emoji, this will just append to itself, which is fine.
                if let Some(ref mut existing_emoji) = emoji_str {
                    existing_emoji.push(' ');
                    existing_emoji.push_str(&args[i]);
                }
            }
        }
    }

    // Check if an emoji string was provided
    let emoji = match emoji_str {
        Some(s) => s,
        None => {
            eprintln!("Usage: {} [-zmk] <emoji>", args[0]);
            std::process::exit(1);
        }
    };

    // Vector to store the final UTF-16 parts (as hexadecimal strings)
    let mut utf16_output_parts: Vec<String> = Vec::new();

    // Iterate over each Unicode character in the input string
    for c in emoji.chars() {
        let codepoint = c as u32; // Get the Unicode codepoint (UTF-32)

        if codepoint < 0x10000 {
            // Basic Multilingual Plane (BMP) characters
            // Directly format as 4-digit hexadecimal
            utf16_output_parts.push(format!("{:04X}", codepoint));
        } else {
            // Supplementary Plane characters (require surrogate pairs)
            // Algorithm for UTF-32 to UTF-16 surrogate pair conversion:
            // U' = U - 0x10000
            // WH = floor(U' / 0x400) + 0xD800
            // WL = (U' % 0x400) + 0xDC00
            let temp = codepoint - 0x10000;
            let high_surrogate = 0xD800 + (temp >> 10);
            let low_surrogate = 0xDC00 + (temp & 0x3FF);

            // Format both surrogates as 4-digit hexadecimal
            utf16_output_parts.push(format!("{:04X}", high_surrogate));
            utf16_output_parts.push(format!("{:04X}", low_surrogate));
        }
    }

    // Process output based on zmk_mode
    if zmk_mode {
        let mut zmk_formatted_parts: Vec<String> = Vec::new();
        for hex_code in utf16_output_parts {
            let mut current_zmk_chars: Vec<String> = Vec::new();
            // Iterate over each character (digit) in the 4-digit hex string
            for digit_char in hex_code.chars() {
                // Convert the hex digit character to its value and then to ZMK format
                let zmk_digit = match digit_char.to_ascii_lowercase() {
                    '0' => "N0",
                    '1' => "N1",
                    '2' => "N2",
                    '3' => "N3",
                    '4' => "N4",
                    '5' => "N5",
                    '6' => "N6",
                    '7' => "N7",
                    '8' => "N8",
                    '9' => "N9",
                    'a' => "A", // Changed: Letters stay uppercase
                    'b' => "B", // Changed: Letters stay uppercase
                    'c' => "C", // Changed: Letters stay uppercase
                    'd' => "D", // Changed: Letters stay uppercase
                    'e' => "E", // Changed: Letters stay uppercase
                    'f' => "F", // Changed: Letters stay uppercase
                    _ => "INVALID", // Should not happen with valid hex
                };
                // Pad each ZMK digit/letter to a width of 2 characters for alignment
                current_zmk_chars.push(format!("{: <2}", zmk_digit));
            }
            zmk_formatted_parts.push(current_zmk_chars.join(", "));
        }
        println!("{}", zmk_formatted_parts.join(", "));
    } else {
        // Standard hexadecimal output
        println!("{}", utf16_output_parts.join(" "));
    }
}
