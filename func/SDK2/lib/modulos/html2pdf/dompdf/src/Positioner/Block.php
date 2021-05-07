<?php
/**
 * @package dompdf
 * @link    https://dompdf.github.com/
 * @author  Benj Carson <benjcarson@digitaljunkies.ca>
 * @license https://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License
 */

namespace Dompdf\Positioner;

use Dompdf\FrameDecorator\AbstractFrameDecorator;

/**
 * Positions block frames
 *
 * @access  private
 * @package dompdf
 */
class Block extends AbstractPositioner {


    function __construct(AbstractFrameDecorator $frame)
    {
        parent::__construct($frame);
    }

    //........................................................................

    function position()
    {
        $frame = $this->_frame;
        $style = $frame->get_style();
        $cb = $frame->get_containing_block();
        $p = $frame->find_block_parent();

        if ($p) {
            $float = $style->float;

            if (!$float || $float === "none") {
                $p->add_line(true);
            }
            $y = $p->get_current_line_box()->y;

        } else {
            $y = $cb["y"];
        }

        $x = $cb["x"];

        // Relative positionning
        if ($style->position === "relative") {
            $top = $style->length_in_pt($style->top, $cb["h"]);
            //$right =  $style->length_in_pt($style->right,  $cb["w"]);
            //$bottom = $style->length_in_pt($style->bottom, $cb["h"]);
            $left = $style->length_in_pt($style->left, $cb["w"]);

            $x += $left;
            $y += $top;
        }

        $frame->set_position($x, $y);
    }
}