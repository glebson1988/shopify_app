import React, {Component} from "react";

class Block1 extends Component {
    render() {
        const {id, image_url, text} = this.props
        const blockText = text || 'Edit this text with yours'

        return (
            <div style={{display: 'flex', alignItems: 'center'}}>
                <p contentEditable={"true"} suppressContentEditableWarning={true} style={{width: '50%', textAlign: 'center', padding: '60px'}}>{blockText}</p>
                <img src={image_url} style={{width: '50%'}} alt=""/>
            </div>
        )
    }
}

export default Block1;
