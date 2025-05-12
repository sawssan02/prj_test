// widgets/navbar.dart
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleDarkMode;
  final Function toggleMenu;

  const Navbar({
    Key? key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.toggleMenu,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String _selected = 'Jobs';
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  void _handleSelect(String value) {
    setState(() {
      _selected = value;
      _isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? const Color(0xFF0B1437).withOpacity(0.3) : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: widget.isDarkMode ? const Color(0xFF2D3748) : const Color(0xFFF0F4F8),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Icon(
                          Icons.search,
                          color: widget.isDarkMode ? Colors.white : Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                color: widget.isDarkMode ? Colors.white60 : Colors.grey,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: widget.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: _toggleDropdown,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                Text(
                                  _selected,
                                  style: TextStyle(
                                    color: widget.isDarkMode ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                  color: widget.isDarkMode ? Colors.white : Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_isDropdownOpen)
                          Positioned(
                            top: 50,
                            right: 0,
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: widget.isDarkMode ? const Color(0xFF2D3748) : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      'Talents',
                                      style: TextStyle(
                                        color: widget.isDarkMode ? Colors.white : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    onTap: () => _handleSelect('Talents'),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Jobs',
                                      style: TextStyle(
                                        color: widget.isDarkMode ? Colors.white : Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    onTap: () => _handleSelect('Jobs'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Menu Button
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: widget.isDarkMode ? Colors.white : Colors.grey[600],
                  ),
                  onPressed: () => widget.toggleMenu(),
                ),
                // Notification Button
                IconButton(
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: widget.isDarkMode ? Colors.white : Colors.grey[600],
                  ),
                  onPressed: () {},
                ),
                // Dark Mode Toggle
                IconButton(
                  icon: Icon(
                    widget.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
                    color: widget.isDarkMode ? Colors.white : Colors.grey[600],
                  ),
                  onPressed: () => widget.toggleDarkMode(),
                ),
                // Profile Avatar
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}