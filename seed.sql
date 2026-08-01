-- Seeds the marketing-content tables with the copy that used to be hardcoded
-- in the Svelte pages. Run AFTER `drizzle-kit push` has created the tables.
--
--   mysql -u <user> -p <database> < seed.sql
--
-- Re-runnable: each section clears its table first, so re-seeding replaces
-- the content rather than duplicating it.

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM `sub_regions`;
DELETE FROM `farms`;
DELETE FROM `page_heroes`;
DELETE FROM `coffee_products`;
DELETE FROM `export_markets`;
DELETE FROM `company_milestones`;
DELETE FROM `gallery_images`;
DELETE FROM `partners`;
DELETE FROM `coffee_regions`;
DELETE FROM `traceability_steps`;
DELETE FROM `faqs`;
DELETE FROM `value_props`;
DELETE FROM `ventures`;
DELETE FROM `site_settings`;

SET FOREIGN_KEY_CHECKS = 1;

-- ---------------------------------------------------------------- page heroes

INSERT INTO `page_heroes` (`page`, `eyebrow`, `title`, `title_accent`, `tagline`, `body`, `image`, `image_alt`) VALUES
('home',
 'Fahem General Trading PLC',
 'Harvested with pride,',
 'shared with passion',
 NULL,
 'We source top-quality beans from the legendary Jimma Zone and beyond, for specialty and commercial markets — blending tradition with innovation.',
 'hero.webp',
 'Ripe coffee cherries poured between hand-woven baskets'),
('about',
 NULL,
 'About Us',
 NULL,
 'Fahem Coffee Plantation: From Bean to Beyond',
 'We operate in sourcing, trading, and coffee plantation sectors — a major player in the Ethiopian coffee industry, contributing to the ECX and exporting premium beans globally.',
 'image14.webp',
 'Hand cradling a basket of ripe coffee cherries'),
('our-coffee',
 NULL,
 'Our Coffee',
 NULL,
 'Harvested with pride, shared with passion',
 'We source premium Arabica beans from Ethiopia''s Jimma Zone, using selective harvesting of ripe cherries and adaptable processing methods tailored to customer preferences.',
 'coffee.webp',
 'Coffee beans spinning in a roasting drum'),
('ventures',
 NULL,
 'Our Ventures',
 NULL,
 'Harvested With Passion, Shared With Pride',
 NULL,
 'image8.webp',
 'Wide view of Ethiopian farmland with mountains in the distance'),
('contact',
 NULL,
 'Contact Us',
 NULL,
 'Get In Touch',
 'Harvested With Passion, Shared With Pride',
 'image5.webp',
 'A cup of coffee resting in a sea of ripe coffee cherries');

-- ---------------------------------------------------------------------- farms

INSERT INTO `farms` (`id`, `name`, `location`, `image`, `description`, `altitude`, `grade`, `stats`, `sort_order`) VALUES
(1, 'Atnago Farm', 'Limmu, Oromia', 'image8.webp',
 'Washing stations and drying mills process coffee from a wide network of out-growers across Limmu.',
 NULL, NULL,
 '["200 hectares (180 arable)","22 tree species for shade","5,000+ out-growers within 50km"]', 0),
(2, 'Gera Farm (Yukro)', 'Gera Woreda', 'image4.webp',
 'Sweet, creamy, floral profile with a distinctive rue aftertaste.',
 '1,900–2,100m', 'Specialty Grade 1',
 '["150 hectares","1,900–2,100m altitude","Specialty Grade 1"]', 1),
(3, 'Gambella Farm', 'Godere Zone', 'image13.webp',
 'Exquisite floral and spicy notes, currently producing 20,000kg annually.',
 '1,900m', NULL,
 '["300 hectares","1,900m altitude","250,000kg annual capacity"]', 2);

-- Atnago''s woreda-level tasting profiles.
INSERT INTO `sub_regions` (`farm_id`, `name`, `altitude`, `notes`, `sort_order`) VALUES
(1, 'Limmu Kossa Woreda', '1750–2000m', 'Sweet with a lingering spicy note', 0),
(1, 'Limmu Seqa Woreda', '1850–2100m', 'Sweet, winey, and citrus notes', 1),
(1, 'Manna Woreda', '1600–2000m', 'Sweet and milky chocolate flavor with a medium body', 2),
(1, 'Goma Woreda', '1550–1800m', 'Dark chocolate, sweet notes, and medium acidic body', 3),
(1, 'Djimmah Town', '1650–1780m', 'Dark chocolate, sometimes with a mild acidity, and a medium to full body', 4);

-- ----------------------------------------------------------- coffee products

INSERT INTO `coffee_products` (`name`, `grade`, `sort_order`) VALUES
('Limmu', 'Grade 2', 0),
('Djimmah', 'Grade 4', 1),
('Djimmah', 'Grade 5', 2),
('Sidamo', 'Grade 2', 3),
('Sidamo', 'Grade 4', 4),
('Yirgacheffe', 'Grade 2', 5),
('Yirgacheffe', 'Grade 4', 6),
('Gera', 'Grade 1', 7);

-- ------------------------------------------------------------ export markets

INSERT INTO `export_markets` (`name`, `sort_order`) VALUES
('North America', 0),
('Europe', 1),
('Australia', 2),
('Asia', 3);

-- -------------------------------------------------------- company milestones

INSERT INTO `company_milestones` (`page`, `period`, `title`, `description`, `sort_order`) VALUES
('home', 'Late 1990s', 'The Foundation',
 'Founded by Mohammed Lalo and Mohammed Muzeyin, who began their journey as local used-clothes merchants.', 0),
('home', 'The Discovery', 'Becoming Pickers',
 'Their hands first touched the earth as they transitioned into coffee pickers, discovering the magic within the bean.', 1),
('home', 'Early 2000s', 'Becoming Suppliers',
 'The vision crystallized into action as they became local coffee suppliers, committed to the trade.', 2),
('about', 'Late 1990s', 'Humble Beginnings',
 'Mohammed Lalo and Mohammed Muzeyin transition from selling used clothing to coffee picking, sparking a lifelong passion.', 0),
('about', '2006', 'Land Acquired',
 'Acquired farmland in the Oromia Limmu region, laying the foundation for our plantations.', 1),
('about', '2013', 'Going Global',
 'Began international export operations, bringing Ethiopian coffee to the world.', 2),
('about', 'Ongoing', 'ECX Partner',
 'An active participant in the Ethiopian Commodity Exchange, sourcing and trading premium beans.', 3);

-- ------------------------------------------------------------ gallery images

INSERT INTO `gallery_images` (`page`, `src`, `alt`, `caption`, `sort_order`) VALUES
('home', 'image10.webp', 'Coffee drying beds beneath a thatched hut', 'Sun-drying at the farm', 0),
('home', 'image11.webp', 'Workers tending vast drying beds at sunset', 'Golden hour on the beds', 1),
('home', 'image14.webp', 'Hand cradling a basket of ripe cherries', 'Cherry by cherry', 2),
('home', 'image6.webp', 'Hands sorting cherries at a washing station', 'Sorting for quality', 3),
('home', 'image9.webp', 'Roasting pan of coffee beans', 'The roast', 4),
('home', 'image3.webp', 'Sack overflowing with roasted beans', 'Ready for export', 5),

('about', 'image2.webp', 'A cup of coffee resting on roasted and green beans', 'The final cup', 0),
('about', 'image5.webp', 'A cup of coffee amid a sea of ripe cherries', 'From cherry to cup', 1),
('about', 'image7.webp', 'A pile of roasted coffee beans', 'Freshly roasted', 2),
('about', 'image9.webp', 'Overhead view of a roasting pan of beans', 'The roast', 3),
('about', 'image11.webp', 'Workers tending vast drying beds at sunset', 'The drying beds', 4),

('our-coffee', 'image1.webp', 'Hands sorting freshly picked coffee cherries', 'Selective harvest', 0),
('our-coffee', 'image10.webp', 'Coffee drying beds beneath a thatched hut', 'Sun-drying', 1),
('our-coffee', 'image11.webp', 'Workers tending vast drying beds at sunset', 'Turning the beds', 2),
('our-coffee', 'image6.webp', 'Hands sorting cherries at a washing station', 'Wet processing', 3),
('our-coffee', 'image14.webp', 'Hand cradling a basket of ripe cherries', 'Quality control', 4),
('our-coffee', 'image7.webp', 'A pile of roasted coffee beans', 'Ready to roast', 5);

-- -------------------------------------------------------------------- partners

INSERT INTO `partners` (`name`, `website_url`, `sort_order`) VALUES
('Coffee Ithaka', 'https://www.coffeeithaka.com', 0),
('Ecom Trading', 'https://www.ecomtrading.com/', 1),
('Louis Dreyfus Company', 'https://www.ldc.com/product/coffee/', 2),
('Touton', 'https://touton.com/', 3),
('Falcon Coffees', 'https://www.falconcoffees.com/', 4);

-- -------------------------------------------------------------- coffee regions

INSERT INTO `coffee_regions` (`name`, `cupping`, `aroma`, `flavor`, `sort_order`) VALUES
('Yirgacheffe', 'Lemon, jasmine, and peach', 'Floral and citrusy',
 'Bright, tea-like with notes of bergamot and stone fruits', 0),
('Guji', 'Blueberry, apricot, and melon', 'Sweet and fruity',
 'Complex with hints of berries and tropical fruits, wine-like acidity', 1),
('Kaffa', 'Dark chocolate, spice, and wine', 'Earthy and rich',
 'Full-bodied with notes of dark chocolate and spices, low acidity', 2),
('Sidamo', 'Berry, citrus, floral, spice, and wine', 'Fruity and floral',
 'Balanced with bright acidity and notes of lemon, berries, and floral undertones', 3),
('Ghimbi', 'Chocolate, nutty, and sweet', 'Rich and smooth',
 'Full-bodied with balanced acidity and notes of chocolate and nuts', 4),
('Illubabor', 'Herbal, nutty, and mild spice', 'Earthy and herbal',
 'Medium-bodied with mild acidity, notes of nuts and mild spices', 5),
('Djimmah', 'Earthy, nutty, and woody', 'Earthy, nutty, and woody',
 'Full-bodied with low acidity and notes of dark chocolate, nuts, and earthy undertones', 6),
('Limmu', 'Fruity, spicy, and sweet', 'Fruity and spicy',
 'Well-balanced with medium acidity and notes of tropical fruits, cinnamon, and caramel', 7);

-- --------------------------------------------------------- traceability steps

INSERT INTO `traceability_steps` (`title`, `description`, `sort_order`) VALUES
('Harvesting Red Cherry', 'members across 18 Kebeles & 4 districts, recorded by purchase voucher', 0),
('Coffee Collection', '114 collection centers, weight and code records', 1),
('Cherry Reception', 'weight records, delivery notes, receiving vouchers at processing sites', 2),
('Pulping', 'pulping records', 3),
('Parchment Drying', 'drying records', 4),
('Storage', 'delivery notes, receiving vouchers, bin cards, lot numbers, tags', 5),
('Addis Ababa Dispatch', 'store issue vouchers, coffee dispatch notes', 6),
('Addis Ababa Warehouse', 'delivery notes, truck registration, milling lot numbers', 7),
('Milling', 'milling records', 8),
('Packing', 'packing records', 9),
('Export / Transport', 'packing and dispatch registers, stock control, truck identification', 10);

-- ------------------------------------------------------------------------ FAQs

INSERT INTO `faqs` (`page`, `question`, `answer`, `sort_order`) VALUES
('our-coffee', 'How are you preparing for EUDR regulation?',
 'Documentation is complete: GPS data collected using the Decimal Degrees system (6 decimal points), completed July 30, 2024, with polygon mapping completed for all farms over 4 hectares.', 0),
('our-coffee', 'What is your annual export volume?',
 'We currently export approximately 400 containers annually, with a goal of reaching 600 containers by 2025.', 1),
('our-coffee', 'What is your processing timeline?',
 'From order to container takes less than one month; the full order-to-delivery process takes approximately three months.', 2),
('our-coffee', 'Do you offer direct trade options?',
 'Yes — we offer direct trade and maintain established international buyer partnerships, alongside community initiatives such as farmer training on child labor and equality, elementary school construction, and agricultural tool distribution.', 3),
('our-coffee', 'How do you support your farming community?',
 'We provide coffee seedling raising and distribution, technical field support for out-growers, and infrastructure including two grain mills, roads, two school blocks, a kindergarten, and electric lines — alongside annual dividend, bonus, and premium distributions to our roughly 5,000 out-growers.', 4),
('our-coffee', 'How do you ensure coffee traceability?',
 'Every lot is tracked from harvesting to packing through a detailed chain of custody, documented at each stage from the farm to export.', 5),

-- Buyer-facing questions for the home page.
('home', 'Which Ethiopian origins do you supply?',
 'We supply Arabica from Limmu, Djimmah, Sidamo, Yirgacheffe and Gera, across commercial and specialty grades. Each origin carries its own cup profile, from bright and citrusy through to deep and chocolatey.', 0),
('home', 'What volumes can you handle?',
 'We currently export approximately 400 containers annually, with a goal of reaching 600 containers by 2025.', 1),
('home', 'How long does an order take?',
 'From order to container takes less than one month; the full order-to-delivery process takes approximately three months.', 2),
('home', 'Do you work directly with buyers?',
 'Yes — we offer direct trade alongside our established international buyer partnerships. Get in touch through the contact page and our team will respond shortly.', 3),

-- Company questions for the About page.
('about', 'When was Fahem General Trading founded?',
 'Our founders, Mohammed Lalo and Mohammed Muzeyin, moved from selling used clothing into coffee picking in the late 1990s. We acquired farmland in the Oromia Limmu region in 2006 and began international export operations in 2013.', 0),
('about', 'Where are your farms?',
 'We operate three farms: Atnago Farm in Limmu, Oromia; Gera Farm (Yukro) in Gera Woreda; and Gambella Farm in the Godere Zone — together covering 650 hectares.', 1),
('about', 'Are you part of the Ethiopian Commodity Exchange?',
 'Yes. We are an active participant in the Ethiopian Commodity Exchange, sourcing and trading premium beans alongside the coffee from our own plantations.', 2),
('about', 'How do you support the farming community?',
 'We provide coffee seedling raising and distribution, technical field support for out-growers, and infrastructure including two grain mills, roads, two school blocks, a kindergarten, and electric lines — alongside annual dividend, bonus, and premium distributions to our roughly 5,000 out-growers.', 3);

-- ------------------------------------------------------------------ value props

-- `icon` must match a name exported by src/lib/components/dynamic-icon.svelte.
INSERT INTO `value_props` (`icon`, `title`, `description`, `sort_order`) VALUES
('Users', 'Empowering Agriculture',
 'We support farmers with essential supplies and expertise, fostering a thriving agricultural sector.', 0),
('Leaf', 'Sustainable Practices',
 'Committed to environmental responsibility, we champion sustainable farming methods.', 1),
('HandCoins', 'Trusted Partner',
 'We prioritize the satisfaction of all stakeholders, building lasting relationships.', 2);

-- --------------------------------------------------------------------- ventures

INSERT INTO `ventures` (`title`, `description`, `image`, `image_alt`, `icon`, `regions_served`, `sort_order`) VALUES
('Fahem Veterinary Medicine',
 'The leading importer of veterinary drugs in Ethiopia. Established to serve the nation''s expanding animal breeding industry, Fahem Veterinary Medicine supplies efficient and effective veterinary medicines, ensuring widespread access to animal health supplies.',
 'farm.webp',
 'Aerial view of Ethiopian farmland',
 'Stethoscope',
 '["Oromia","Amhara","Afar","South Ethiopia"]',
 0);

-- ----------------------------------------------------------------- site settings

INSERT INTO `site_settings` (`emails`, `phones`, `address`, `tagline`, `footer_blurb`) VALUES
-- The first email and phone are what the footer advertises, so keep the
-- general-inquiries address at the front of the list.
('[{"label":"General Inquiries","value":"info@fahemgeneraltrading.com"},{"label":"Trade","value":"trade@fahemgeneraltrading.com"},{"label":"Import Manager","value":"importmanager@fahemgeneraltrading.com"}]',
 '["+251 969 211 115","+251 917 550 853"]',
 'Kera Road, Bulgaria, Diplomat Building, 3rd floor, office number 301',
 'Harvested With Passion, Shared With Pride',
 'Harvested With Passion, Shared With Pride. Sourcing premium Ethiopian Arabica beans from the legendary Jimma Zone and beyond, for specialty and commercial markets worldwide.');
