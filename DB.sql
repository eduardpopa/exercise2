USE javaee;

-- Drop Tables if they exist
DROP TABLE IF EXISTS document_author;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS document;

-- Create Tables
CREATE TABLE author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE document (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_date DATE NOT NULL,
    abstract TEXT,
    storage_location VARCHAR(255)
);

CREATE TABLE document_author (
    document_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (document_id, author_id),
    CONSTRAINT fk_document FOREIGN KEY (document_id) REFERENCES document (id) ON DELETE CASCADE,
    CONSTRAINT fk_author FOREIGN KEY  (author_id) REFERENCES author (id) ON DELETE CASCADE
   
);

-- Insert Authors
INSERT INTO author (first_name, last_name) VALUES 
('Kevin', 'Lacker'),
('Nicholas', 'Carlini'),
('Marta', 'Różańska'),
('Geir', 'Horn'),
('Yazeed Yasin', 'Ghadi'),
('Syed Faisal Abbas', 'Shah'),
('Tehseen', 'Mazhar'),
('Tariq', 'Shahzad'),
('Khmaies', 'Ouahada'),
('Habib', 'Hamam'),
('Guangshun', 'Li'),
('Haoyang', 'Wu'),
('Junhua', 'Wu'),
('Zhenqiang', 'Li'),
('Hailang', 'Cheng'),
('Mengmeng', 'Cui'),
('Yuzhe', 'Shi');

-- Insert Documents
INSERT INTO document (title, publication_date, abstract, storage_location) VALUES 
('A Comprehensive Overview of Large Language Models', '2024-03-28', 'This paper reviews the advancements in large language models (LLMs), focusing on various techniques such as tokenization, positional encoding, and attention mechanisms. It aims to provide a thorough understanding of the innovations and challenges in the development of LLMs.', 'https://ar5iv.labs.arxiv.org/html/2307.06435'),
('Constrained Optimal Grouping of Cloud Application Components', '2023-05-10', 'This study addresses the challenge of deploying cloud application components efficiently. It presents an algorithm for grouping these components on a minimal number of virtual machines (VMs), balancing cost-efficiency and performance.', 'https://journalofcloudcomputing.springeropen.com/articles/10.1186/s13677-024-0020-2'),
('Enhancing Patient Healthcare with Mobile Edge Computing and 5G: Challenges and Solutions for Secure Online Health Tools', '2022-05-02', 'This paper explores the integration of 5G and Mobile Edge Computing (MEC) to improve patient healthcare services. It discusses the benefits and challenges of these technologies in ensuring secure and efficient healthcare solutions.', 'https://journalofcloudcomputing.springeropen.com/articles/10.1186/s13677-024-0019-6'),
('Efficient and Secure Privacy Protection Scheme and Consensus Mechanism in MEC Enabled E-commerce Consortium Blockchain', '2021-05-09', 'This research introduces a privacy protection scheme and consensus mechanism for e-commerce applications using Mobile Edge Computing (MEC) and blockchain technology. It aims to enhance transparency, security, and efficiency in e-commerce transactions.', 'https://journalofcloudcomputing.springeropen.com/articles/10.1186/s13677-024-0018-7'),
('STAM-LSGRU: A Spatiotemporal Radar Echo Extrapolation Algorithm with Edge Computing for Short-term Forecasting', '2020-05-14', 'This paper presents an algorithm for short-term weather forecasting using spatiotemporal radar echo data and edge computing. The proposed method aims to improve the accuracy and efficiency of weather predictions.', 'https://journalofcloudcomputing.springeropen.com/articles/10.1186/s13677-024-0021-1'),
('Exploring the Impact of AI on Modern Healthcare Systems', '2024-05-20', 'This study examines the influence of artificial intelligence (AI) on contemporary healthcare systems, focusing on diagnostic accuracy, patient outcomes, and operational efficiency.', 'https://example.com/article6'),
('Advancements in Quantum Computing: A Comprehensive Review', '2023-06-01', 'This review article discusses the recent advancements in quantum computing, including quantum algorithms, error correction techniques, and practical applications.', 'https://example.com/article7'),
('Blockchain Technology in Supply Chain Management: Benefits and Challenges', '2022-04-15', 'This paper explores the integration of blockchain technology in supply chain management, highlighting the benefits, challenges, and future directions.', 'https://example.com/article8'),
('The Role of Big Data Analytics in Business Decision Making', '2021-03-30', 'This article investigates how big data analytics is transforming business decision-making processes, emphasizing predictive analytics and real-time data processing.', 'https://example.com/article9'),
('Cybersecurity Trends in the Age of IoT', '2020-04-22', 'This study analyzes the emerging trends in cybersecurity, particularly in the context of the Internet of Things (IoT), and suggests strategies for mitigating security risks.', 'https://example.com/article10'),
('The Future of Renewable Energy: Innovations and Policies', '2024-05-25', 'This paper reviews the latest innovations and policy developments in renewable energy, focusing on solar, wind, and bioenergy technologies.', 'https://example.com/article11'),
('Artificial Intelligence in Autonomous Vehicles: Progress and Challenges', '2023-06-05', 'This research examines the progress and challenges in deploying artificial intelligence in autonomous vehicles, with a focus on safety, reliability, and regulatory issues.', 'https://example.com/article12'),
('The Impact of 5G Technology on Internet of Things (IoT) Applications', '2022-05-05', 'This article explores how 5G technology is revolutionizing Internet of Things (IoT) applications, improving connectivity, speed, and device integration.', 'https://example.com/article13'),
('Smart Cities: Leveraging Technology for Urban Development', '2021-06-10', 'This paper discusses how smart city initiatives are leveraging technology to enhance urban development, improve public services, and promote sustainable living.', 'https://example.com/article14'),
('Machine Learning Techniques for Predictive Maintenance', '2020-05-12', 'This study investigates various machine learning techniques for predictive maintenance, focusing on their applications, benefits, and implementation challenges.', 'https://example.com/article15'),
('The Evolution of Cloud Computing: Trends and Future Directions', '2024-06-03', 'This article reviews the evolution of cloud computing, identifying current trends and predicting future directions for cloud services and infrastructure.', 'https://example.com/article16'),
('Data Privacy in the Digital Age: Challenges and Solutions', '2023-04-20', 'This paper examines the challenges and solutions related to data privacy in the digital age, focusing on regulatory frameworks, encryption, and user consent mechanisms.', 'https://example.com/article17'),
('Leveraging Edge Computing for Real-Time Data Processing', '2022-05-18', 'This study explores how edge computing is used for real-time data processing, discussing its benefits, challenges, and use cases in various industries.', 'https://example.com/article18'),
('The Role of Artificial Intelligence in Financial Services', '2021-04-25', 'This article investigates the role of artificial intelligence in financial services, highlighting its impact on fraud detection, customer service, and investment strategies.', 'https://example.com/article19'),
('Telemedicine: Transforming Healthcare Delivery', '2020-06-15', 'This paper discusses how telemedicine is transforming healthcare delivery, focusing on its benefits, challenges, and future potential.', 'https://example.com/article20');
-- Insert Document_Author Relationships
INSERT INTO document_author (document_id, author_id) VALUES 
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10),
(4, 11), (4, 12), (4, 13), (4, 14),
(5, 15), (5, 16), (5, 17),
(5, 6), (5, 1), 
(6, 2), 
(7, 10), (7, 14), 
(8, 10),
(9, 1), (9, 2),
(10, 3), (10, 4),
(11, 7), 
(12, 9), (12, 12),
(13, 1), (13, 7),
(14, 3), (14, 17),
(15, 10),
(16, 10),
(17, 13),
(18, 13),
(19, 15),
(20, 15), (20, 16), (20, 17);

COMMIT;
